//
//  LaunchVM.swift
//  RocketLaunchExercise
//
//  Created by Arun Thakkar on 5/13/21.
//

import Foundation

class LaunchVM {
    var sortDate: String?
    let launchName: String?
    let launchDescription: String?
    let tags: [Tag]?
    let pad: Pad?
    
    init(name:String?, sortDate: String?, launchDescription:String?, pad: Pad?, tags:[Tag]?) {
        self.launchName = name
        
        self.launchDescription = launchDescription
        self.pad = pad
        self.tags = tags
        self.sortDate = CommonUtility.getTimeFromString(sortDate ?? "")
        
    }
}
