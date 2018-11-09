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
    @NSManaged var maxReserveHours: Int
    
    class func parseClassName() -> String {
        return "Schedule"
    }
    
    class func makeNewSchedule(type: String, maxHoursReservable: Int? = 0,withCompletion completion: PFBooleanResultBlock?) {
        let schedule = Schedule()
        
        schedule.owner = PFUser.current()!
        schedule.type = type
        schedule.maxReserveHours = maxHoursReservable!
        schedule.saveInBackground(block: completion)
    }
}
