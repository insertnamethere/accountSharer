//
//  Schedule.swift
//  accountSharer
//
//  Created by Will Xu  on 10/17/18.
//  Copyright © 2018 Will Xu . All rights reserved.
//

import Foundation
import Parse

class Schedule: PFObject, PFSubclassing {
    @NSManaged var owner: PFUser
    @NSManaged var type: String
    
    class func parseClassName() -> String {
        return "Schedule"
    }
    
    class func makeNewSchedule(type: String, withCompletion completion: PFBooleanResultBlock?) {
        let schedule = Schedule()
        
        schedule.owner = PFUser.current()!
        schedule.type = type
        
        schedule.saveInBackground(block: completion)
    }
}
