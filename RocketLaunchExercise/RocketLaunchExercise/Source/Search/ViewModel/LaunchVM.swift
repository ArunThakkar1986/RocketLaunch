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
    let location : String?
    var name = ""
    var state = ""
    var country = ""
    
    
    init(name:String?, sortDate: String?, launchDescription:String?, pad: Pad?, tags:[Tag]?) {
        self.launchName = name
        
        self.launchDescription = launchDescription
        self.pad = pad
        self.tags = tags
        self.sortDate = CommonUtility.getTimeFromString(sortDate ?? "")
        self.name = pad?.location?.name ?? ""
        self.state = pad?.location?.state ?? ""
        self.country = pad?.location?.country ?? ""
        self.location = self.name + ", " + self.state + ", " + self.country
    }
}
