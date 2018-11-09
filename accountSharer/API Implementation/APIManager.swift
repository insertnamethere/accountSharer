//
//  APIManager.swift
//  accountSharer
//
//  Created by Will Xu  on 10/17/18.
//  Copyright © 2018 Will Xu . All rights reserved.
//

import Foundation
import Parse

class APIManager {
    class func registerUser(username: String, password: String, withCompletion completion: PFBooleanResultBlock?) {
        let newUser = PFUser()
        
        newUser.username = username
        newUser.password = password
        newUser["username_lc"] = username.lowercased()
        newUser.signUpInBackground(block: completion)
    }
    
    class func loginUser(username: String, password: String, withCompletion completion: PFUserResultBlock?) {
        PFUser.logInWithUsername(inBackground: username, password: password, block: completion)
    }
    
    class func logoutUser(withCompletion completion: @escaping (Error?) -> Void) {
        PFUser.logOutInBackground(block: completion)
    }
    
    
    class func makeNewSchedule(type: String, maxReservableHours: Int) {
        Schedule.makeNewSchedule(type: type, maxHoursReservable: maxReservableHours) {(success: Bool?, error: Error?) in
            if (success!) {
                print("posted")
            } else {
                print(error?.localizedDescription ?? "this is bad. like really bad. abandon all hope ye who enter.")
            }
        }
    }
    
    class func getSchedules(user: PFUser, completion: @escaping ([PFObject]?, Error?) -> ()) {
        let query = Schedule.query()
        query?.includeKey("owner")
        query?.whereKey("owner", equalTo: user)
        query?.addAscendingOrder("createdAt")
        query?.findObjectsInBackground(block: completion)
    }
    
    class func delSchedules(schedule: Schedule, completion: @escaping (Bool?, Error?) -> ()) {
        let query = Schedule.query()
        query?.getObjectInBackground(withId: schedule.objectId!) {
            (scheduleDelete: PFObject?, error: Error?) -> Void in
            let timeSlotQuery = TimeSlot.query()
            timeSlotQuery?.whereKey("schedule", equalTo: scheduleDelete!)
            timeSlotQuery?.findObjectsInBackground() {
                (timeSlots: [PFObject]?, error: Error?) -> Void in
                for timeSlot in timeSlots! {
                    timeSlot.deleteInBackground()
                }
            }
            scheduleDelete?.deleteInBackground(block: completion)
        }
    }
    
    class func getResults(searchString: String, completion: @escaping ([PFObject]?, Error?) -> ()) {
        let query = PFUser.query()
        query?.includeKey("username_lc")
        query?.whereKey("username_lc", contains: searchString)
        query?.addAscendingOrder("username_lc")
        query?.findObjectsInBackground(block: completion)
    }
    
    class func getTimeSlots(schedule: Schedule, completion: @escaping ([PFObject]?, Error?) -> ()) {
        let query = TimeSlot.query()
        query?.includeKey("owner")
        query?.whereKey("schedule", equalTo: schedule)
        query?.addAscendingOrder("timeStart")
        query?.findObjectsInBackground(block: completion)
    }
    
    
    class func getTimeSlots(user: PFUser, completion: @escaping ([PFObject]?, Error?) -> ()) {
        let query = TimeSlot.query()
        query?.includeKey("owner")
        query?.includeKey("schedule")
        query?.includeKey("schedule.owner")
        query?.whereKey("owner", equalTo: user)
        query?.addAscendingOrder("schedule")
        query?.findObjectsInBackground(block: completion)
    }
    
    class func delTimeSlot(timeSlot: TimeSlot, completion: @escaping (Bool?, Error?) -> ()) {
        let query = TimeSlot.query()
        query?.getObjectInBackground(withId: timeSlot.objectId!) {
            (timeSlotDelete: PFObject?, error: Error?) -> Void in
            timeSlotDelete?.deleteInBackground(block: completion)
        }
    }
    
    class func addTimeSlots(timeSlot: TimeSlot, withCompletion completion: PFBooleanResultBlock?) {
        timeSlot.saveInBackground(block: completion)
    }
    
    class func showAlert(title: String, message: String, controller: UIViewController) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        // create an OK action
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
        }
        // add the OK action to the alert controller
        alertController.addAction(OKAction)
        
        controller.present(alertController, animated: true, completion: nil)
    }
    
    class func showAlert(title: String, message: String, controller: UIViewController, completion: @escaping () -> ()) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        // create an OK action
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
            completion()
        }
        // add the OK action to the alert controller
        alertController.addAction(OKAction)
        
        controller.present(alertController, animated: true, completion: completion)
    }
}
