//
//  CommonUtility.swift
//  MovieBrowser
//
//  Created by Arun Thakkar on 5/6/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import Foundation
import UIKit

class CommonUtility {
    // MARK: - Show Alert Generic Method
    class func showErrorAlert(with message: String, controller:UIViewController) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(okAction)
        controller.present(alert, animated: true, completion: nil)
    }
    
    // MARK: - getTimeFromString - converts string (seconds) to Date
    class func getTimeFromString(_ dateString:String) -> String{
        if let timeResult = Double(dateString) {
            let date = Date(timeIntervalSince1970: timeResult)
            let dateFormatter = DateFormatter()
            dateFormatter.timeStyle = DateFormatter.Style.medium //Set time style
            dateFormatter.dateStyle = DateFormatter.Style.medium //Set date style
            dateFormatter.timeZone = .current
            return dateFormatter.string(from: date)
        }
        return ""
    }
}
