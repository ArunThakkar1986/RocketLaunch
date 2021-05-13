//
//  LaunchListCell.swift
//  RocketLaunchExercise
//
//  Created by Arun Thakkar on 5/12/21.
//

import UIKit

class LaunchListCell: UITableViewCell {
    @IBOutlet weak var lblLaunchTitle : UILabel!
    @IBOutlet weak var lblLaunchSortDate : UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
