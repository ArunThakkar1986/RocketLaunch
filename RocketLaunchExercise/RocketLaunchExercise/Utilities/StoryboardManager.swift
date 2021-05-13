//
//  StoryboardManager.swift
//  MovieBrowser
//
//  Created by Arun Thakkar on 5/6/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import Foundation

import Foundation
import UIKit

class StoryboardManager: NSObject {
    
    // MARK: - getMainStoryBoard
    class func getMainStoryBoard() -> UIStoryboard {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard
    }
}
