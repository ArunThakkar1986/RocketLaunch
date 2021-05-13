//
//  ViewController.swift
//  RocketLaunchExercise
//
//  Created by Arun Thakkar on 5/12/21.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var tblLaunches : UITableView!
    @IBOutlet weak var searchBar : UISearchBar!
    @IBOutlet weak var btnGo     : UIButton!
    @IBOutlet weak var searchHeader : UIStackView!
    @IBOutlet weak var progressBar : UIActivityIndicatorView!

    
    let rocketLaunchVM = RocketLaunchVM()
    var resultArray : [Result]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchHeader.isHidden = true
        searchBar.delegate = self
        self.progressBar.isHidden = false;
        
        self.loadRocketLaunchList()
    }
    
    // MARK: - loadRocketLaunchList : Initiating the API Request through VM
    func loadRocketLaunchList() {
        
        rocketLaunchVM.fetchRocketLaunchList(completion: { [weak self](response) in
            self?.progressBar.isHidden = true
            switch(response){
            case .success(_):
                if self?.rocketLaunchVM.launches?.count ?? 0 > 0{
                    self?.resultArray = self?.rocketLaunchVM.launches?.result
                    self?.searchHeader.isHidden = false
                    self?.tblLaunches.reloadData()
                    
                }
            case .failure(_):
                if let error = response.error {
                    self?.handleError(error)
                }
            }
        })
    }
    // MARK: - validateEmptyField : Checking if searchbar Search Text is empty or not
    func validateEmptyField(searchText:String) -> Bool{
        searchText.count == 0 ? true : false
    }
    
    // MARK: - onclick_LaunchSearch : For user's who prefers search with Some action
    @IBAction func onclick_LaunchSearch(_ sender: Any){
        self.validateEmptyField(searchText: self.searchBar.text ?? "") ? CommonUtility.showErrorAlert(with: MSG_EMPTY_FIELD, controller: self) : self.filterLaunchResultWithName(self.searchBar.text ?? "")
        self.searchBar.endEditing(true)
    }
    
    // MARK: - filterLaunchResultWithName : Filtering the result based on search (Supports search by name)
    func filterLaunchResultWithName(_ name:String) {
        if name.count == 0 {
            self.resultArray = self.rocketLaunchVM.launches?.result
        }
        else {
            if let array =  self.rocketLaunchVM.launches?.result.filter({($0.name?.localizedCaseInsensitiveContains(name)) ?? false}) {
                self.resultArray = array
            }
        }
        self.tblLaunches.reloadData()
    }
    
    func navigateToDetailViewController(selectedLaunchVM:LaunchVM) {
        let mainStoryboard = StoryboardManager.getMainStoryBoard()
        let launchDetailVC = mainStoryboard.instantiateViewController(withIdentifier: "LaunchDetailView") as! DetailViewController
        launchDetailVC.launnchVM = selectedLaunchVM
        self.navigationController?.pushViewController(launchDetailVC, animated: true)
    }

    func handleError(_ error : WebError<CustomError>) {
        
        switch error {
        
        case .noInternetConnection:
            CommonUtility.showErrorAlert(with: MSG_NO_INTERNET, controller: self)
            
        case .custom(let error):
            CommonUtility.showErrorAlert(with: error.message, controller: self)
           
        case .unauthorized:
            CommonUtility.showErrorAlert(with: MSG_UNAUTHORIZED, controller: self)
           
        case .other:
            CommonUtility.showErrorAlert(with:MSG_OTHER, controller: self)
        }
    }
}

extension SearchViewController : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.filterLaunchResultWithName(searchText)
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchBar.endEditing(true)
    }
}

extension SearchViewController : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        var numOfSections: Int = 0
        if self.resultArray?.count ?? 0 > 0
        {
            tableView.separatorStyle = .singleLine
            numOfSections            = 1
            tableView.backgroundView = nil
        }
        else if (self.resultArray != nil) 
        {
            let noDataLabel: UILabel  = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: tableView.frame.size.height))
            noDataLabel.text          = "No Launch found"
            noDataLabel.textColor     = UIColor.black
            noDataLabel.textAlignment = .center
            tableView.backgroundView  = noDataLabel
            tableView.separatorStyle  = .none
        }
        return numOfSections
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.resultArray?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let launchListCell = self.tblLaunches.dequeueReusableCell(withIdentifier: "Cell") as! LaunchListCell
        launchListCell.lblLaunchTitle.text =  self.resultArray?[indexPath.row].name
        launchListCell.lblLaunchSortDate.text = CommonUtility.getTimeFromString( self.resultArray?[indexPath.row].sortDate ?? "")
        return launchListCell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let selectedLaunch = self.resultArray?[indexPath.row]{
            
            let selectedLaunchVM = LaunchVM(name: selectedLaunch.name, sortDate: selectedLaunch.sortDate, launchDescription: selectedLaunch.launchDescription, pad: selectedLaunch.pad, tags: selectedLaunch.tags)
            self.navigateToDetailViewController(selectedLaunchVM: selectedLaunchVM)
            }
        }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
