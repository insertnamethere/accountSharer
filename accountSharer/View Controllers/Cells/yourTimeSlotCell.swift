//
//  timeSlotCell.swift
//  accountSharer
//
//  Created by Will Xu  on 10/18/18.
//  Copyright © 2018 Will Xu . All rights reserved.
//

import UIKit

class yourTimeSlotCell: UITableViewCell {
    
    @IBOutlet weak var timeEndLabel: UILabel!
    @IBOutlet weak var timeStartLabel: UILabel!
    @IBOutlet weak var scheduleLabel: UILabel!

    var timeSlot: TimeSlot! {
        didSet {
            self.scheduleLabel.text = timeSlot.schedule.owner.username! + "'s " + timeSlot.schedule.type
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
