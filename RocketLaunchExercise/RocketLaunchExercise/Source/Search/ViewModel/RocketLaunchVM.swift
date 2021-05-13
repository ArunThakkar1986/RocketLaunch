//
//  RocketLaunchVM.swift
//  RocketLaunchExercise
//
//  Created by Arun Thakkar on 5/12/21.
//

import Foundation

class RocketLaunchVM{
    var launches : RocketLaunches?
    var custError : Error?
    
    func fetchRocketLaunchList(completion: @escaping (ResultSet<RocketLaunches, CustomError>) -> ()){
        Network.searchLaunches(completion: { [weak self ](launchListResponse) in
           switch(launchListResponse){
           case .success(let response):
               self?.launches = response
               completion(launchListResponse)
           case .failure(_):
               completion(launchListResponse)
           }
           })
       }
}
extension RocketLaunchVM {
    
}
