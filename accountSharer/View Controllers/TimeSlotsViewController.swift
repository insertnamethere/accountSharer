//
//  TimeSlotsViewController.swift
//  accountSharer
//
//  Created by Will Xu  on 10/17/18.
//  Copyright © 2018 Will Xu . All rights reserved.
//

import UIKit
import Parse

class TimeSlotsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var timeSlots: [TimeSlot] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.tableFooterView = UIView()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.getTimeSlots()
    }
    
    func getTimeSlots() {
        APIManager.getTimeSlots(user: PFUser.current()!) { (result: [PFObject]?, error: Error?) in
            if let result = result {
                self.timeSlots = result as! [TimeSlot]
                self.tableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        APIManager.delTimeSlot(timeSlot: timeSlots[indexPath.row])  { (success: Bool?, error: Error?) in
            if (success!) {
                self.timeSlots.remove(at: indexPath.row)
                self.tableView.reloadData()
            } else {
                print(error?.localizedDescription ?? "")
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timeSlots.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "yourTimeSlotCell", for: indexPath) as! yourTimeSlotCell
        cell.timeSlot = timeSlots[indexPath.row]
        return cell
    }
}
