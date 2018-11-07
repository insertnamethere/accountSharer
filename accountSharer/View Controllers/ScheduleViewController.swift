//
//  ScheduleViewController.swift
//  accountSharer
//
//  Created by Will Xu  on 10/16/18.
//  Copyright © 2018 Will Xu . All rights reserved.
//

import UIKit
import Parse

class ScheduleViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    
    var schedules: [Schedule] = []
    var selectedSchedule: Schedule!
    var user: PFUser = PFUser.current()!
    var editting = false;
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editMode))
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.getSchedules()
    }
    
    @objc func editMode() {
        self.editting = !self.editting
        self.navigationItem.leftBarButtonItem?.title = editting ? "Done" : "Edit"
        self.tableView.setEditing(editting, animated: true)
    }
    
    func getSchedules() {
        APIManager.getSchedules(user: user, completion: { (schedules: [PFObject]?, error: Error?) in
            if let schedules = schedules {
                self.schedules = schedules as! [Schedule]
                self.tableView.reloadData()
            }
        })
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let schedule = schedules[indexPath.row]
        self.selectedSchedule = schedule
        self.performSegue(withIdentifier: "toMakeTimeSlot", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "toMakeTimeSlot") {
            let destVC = segue.destination as! ViewTimeSlotViewController
            destVC.schedule = self.selectedSchedule
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.schedules.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "scheduleCell", for: indexPath) as! scheduleCell
        let schedule = schedules[indexPath.row]
        cell.schedule = schedule
        return cell
    }
}
