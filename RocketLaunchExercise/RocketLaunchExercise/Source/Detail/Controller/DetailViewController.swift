//
//  DetailViewController.swift
//  RocketLaunchExercise
//
//  Created by Arun Thakkar on 5/12/21.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var lblLaunchName : UILabel!
    @IBOutlet weak var lblSortDate : UILabel!
    @IBOutlet weak var txtDescription : UITextView!
    @IBOutlet weak var tblTags : UITableView!
    
    var launnchVM : LaunchVM!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.displayUI()
        // Do any additional setup after loading the view.
    }
    // MARK: - displayUI - Field Data mapping to display
    func displayUI() {
        self.lblLaunchName.text = launnchVM.launchName
        self.lblSortDate.text = launnchVM.sortDate
        self.txtDescription.text = launnchVM.launchDescription
    }

}

// MARK: - Table View ( For Tags) Delegate and Data Source
extension DetailViewController : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int
    {
        var numOfSections: Int = 0
        if launnchVM.tags?.count ?? 0 > 0
        {
            tableView.separatorStyle = .singleLine
            numOfSections            = 1
            tableView.backgroundView = nil
        }
        else
        {
            let noDataLabel: UILabel  = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: tableView.frame.size.height))
            noDataLabel.text          = "No Tags found"
            noDataLabel.textColor     = UIColor.black
            noDataLabel.textAlignment = .center
            tableView.backgroundView  = noDataLabel
            tableView.separatorStyle  = .none
        }
        return numOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return launnchVM.tags?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tagListCell = self.tblTags.dequeueReusableCell(withIdentifier: "TagCell") as! TagListCell
        tagListCell.lblTag.text = self.launnchVM.tags?[indexPath.row].text
        
        return tagListCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
