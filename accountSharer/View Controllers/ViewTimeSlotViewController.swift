//
//  MakeTimeSlotViewController.swift
//  accountSharer
//
//  Created by Will Xu  on 10/18/18.
//  Copyright © 2018 Will Xu . All rights reserved.
//

import UIKit
import Parse

class ViewTimeSlotViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var timeSlots: [TimeSlot] = []
    var schedule: Schedule! {
        didSet {
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = schedule.owner.username! + "'s " + schedule.type
        if (schedule.owner.objectId == PFUser.current()?.objectId) {
            self.title = "Your " + schedule.type
        }
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addTapped))
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.tableFooterView = UIView()
        self.getTimeSlots()
        // Do any additional setup after loading the view.
    }
    
    func getTimeSlots() {
        APIManager.getTimeSlots(schedule: schedule) { (result: [PFObject]?, error: Error?) in
            if let result = result {
                self.timeSlots = result as! [TimeSlot]
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.getTimeSlots()
    }
    
    @objc func addTapped() {
        self.performSegue(withIdentifier: "toAddTimeSlot", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "toAddTimeSlot") {
            let destVC = segue.destination as! MakeTimeSlotViewController
            destVC.timeSlots = self.timeSlots
            destVC.schedule = self.schedule
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "timeSlotCell", for: indexPath) as! timeSlotCell
        cell.timeSlot = timeSlots[indexPath.row]
        return cell
    }

}
