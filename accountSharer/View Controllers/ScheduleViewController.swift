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
        if (user == PFUser.current()) {
            //self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editMode))
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addSchedule))
        } else {
            self.navigationItem.rightBarButtonItem = .none
        }
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let deleteThisSchedule = schedules[indexPath.row]
        APIManager.delSchedules(schedule: deleteThisSchedule) { (success: Bool?, error: Error?) in
            if (success!) {
                self.schedules.remove(at: indexPath.row)
                print(self.schedules.count)
                if (self.schedules.count == 0) {
                    self.editOff()
                }
                self.tableView.reloadData()
            
            } else {
                APIManager.showAlert(title: "Error", message: "Could not delete schedule. Try again", controller: self)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.getSchedules()
    }
    
    @objc func addSchedule() {
        self.performSegue(withIdentifier: "toAddSchedules", sender: self)
    }
    
    @objc func editMode() {
        if (editting == false && self.schedules.count == 0) {
            return;
        }
        if (self.editting) {
            self.editOff()
        } else {
            self.editOn();
        }
    }
    
    func editOn() {
        self.editting = true;
        self.navigationItem.leftBarButtonItem?.title = "Done"
        self.tableView.setEditing(self.editting, animated: true)
    }

    func editOff() {
        self.editting = false;
        self.navigationItem.leftBarButtonItem?.title = "Edit"
        self.tableView.setEditing(self.editting, animated: true)
    }
    
    func getSchedules() {
        APIManager.getSchedules(user: user, completion: { (schedules: [PFObject]?, error: Error?) in
            if (schedules!.count == 0) {
                APIManager.showAlert(title: "Error", message: "User has no accounts to share", controller: self) {
                    self.navigationController?.popViewController(animated: true)
                    return
                }
            }
            
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
