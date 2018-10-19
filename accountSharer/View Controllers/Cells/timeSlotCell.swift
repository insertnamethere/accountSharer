//
//  timeSlotCell.swift
//  accountSharer
//
//  Created by Will Xu  on 10/18/18.
//  Copyright © 2018 Will Xu . All rights reserved.
//

import UIKit

extension Date
{
    func toString( dateFormat format  : String ) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.amSymbol = "AM"
        dateFormatter.pmSymbol = "PM"
        return dateFormatter.string(from: self)
    }
    
}

class timeSlotCell: UITableViewCell {

    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var timeStartLabel: UILabel!
    @IBOutlet weak var timeEndLabel: UILabel!
    
    var timeSlot: TimeSlot! {
        didSet {
            self.usernameLabel.text = timeSlot.owner.username
            self.timeStartLabel.text = timeSlot.timeStart.toString(dateFormat: "dd-MM h:MM a")
            self.timeEndLabel.text = timeSlot.timeEnd.toString(dateFormat: "dd-MM h:mm a")
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
