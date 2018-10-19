//
//  accountCell.swift
//  accountSharer
//
//  Created by Will Xu  on 10/17/18.
//  Copyright © 2018 Will Xu . All rights reserved.
//

import UIKit

class scheduleCell: UITableViewCell {
    @IBOutlet weak var typeLabel: UILabel!
    
    
    var schedule: Schedule! {
        didSet {
            self.typeLabel.text = schedule.type
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
