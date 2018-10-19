//
//  MakeTimeSlotViewController.swift
//  accountSharer
//
//  Created by Will Xu  on 10/18/18.
//  Copyright © 2018 Will Xu . All rights reserved.
//

import UIKit
import Parse

class MakeTimeSlotViewController: UIViewController {

    
    @IBOutlet weak var dateStartPicker: UIDatePicker!
    @IBOutlet weak var dateEndPicker: UIDatePicker!
    var schedule: Schedule!
    var timeSlots: [TimeSlot] = []
    var timeSlot: TimeSlot!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func reservePressed(_ sender: Any) {
        let timeSlot = TimeSlot()
        timeSlot.owner = PFUser.current()!
        timeSlot.timeStart = dateStartPicker.date
        timeSlot.timeEnd = dateEndPicker.date
        timeSlot.schedule = self.schedule
        self.timeSlot = timeSlot
        self.addTimeSlot()
    }
    
    func addTimeSlot() {
        print(timeSlots)
        
        if (timeSlot.timeStart >= timeSlot.timeEnd) {
            APIManager.showAlert(title: "Error", message: "Time start must be before time end", controller: self)
            return
        }
        
        for existingTimeSlot in timeSlots {
            if (timeSlot.timeStart >= existingTimeSlot.timeStart && timeSlot.timeStart <= existingTimeSlot.timeEnd || timeSlot.timeEnd >= existingTimeSlot.timeStart && timeSlot.timeEnd <= existingTimeSlot.timeEnd) {
                APIManager.showAlert(title: "Error", message: "Time overlaps with existing time", controller: self)
                return
            }
        }
        
        
        APIManager.addTimeSlots(timeSlot: self.timeSlot) { (success: Bool, error: Error?) in
            if let error = error {
                print(error.localizedDescription)
                APIManager.showAlert(title: error.localizedDescription, message: "", controller: self)
            } else {
                APIManager.showAlert(title: "Success", message: "Time Slot Reserved", controller: self) {() in 
                    _ = self.navigationController?.popViewController(animated: true)
                }
            }
        }
    }
}
