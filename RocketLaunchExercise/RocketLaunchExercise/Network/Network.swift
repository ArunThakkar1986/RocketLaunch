//
//  Network.swift
//  RocketLaunchExercise
//
//  Created by Arun Thakkar on 5/12/21.


import UIKit

class Network {

    static let sharedWebClient = WebClient.init(baseUrl: BASE_URL)
    static var statsTask: URLSessionDataTask!
    static var launchListResponse: ResultSet<RocketLaunches,CustomError>!
    
    // MARK: - searchLaunches - Makes Actual rest client load request to fetch launches
    class func searchLaunches(completion: @escaping (ResultSet<RocketLaunches, CustomError>) -> ()){
        statsTask?.cancel()
        let pathString : String = SEARCH_PATH
        let launchSearchResource = Resource<RocketLaunches, CustomError>(
            jsonDecoder: JSONDecoder(),
            path: pathString,
            method: .get)
        
        statsTask = sharedWebClient.load(resource: launchSearchResource, completion: { (response) in
            DispatchQueue.main.async {
               completion(response)
            }
        })
    }

}
