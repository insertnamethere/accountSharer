//
//  resultCell.swift
//  accountSharer
//
//  Created by Will Xu  on 10/17/18.
//  Copyright © 2018 Will Xu . All rights reserved.
//

import UIKit
import Parse

class resultCell: UITableViewCell {
    @IBOutlet weak var resultLabel: UILabel!
    
    var user: PFUser! {
        didSet {
            self.resultLabel.text = (user["username"] as! String)
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
