//
//  AddAccountViewController.swift
//  accountSharer
//
//  Created by Will Xu  on 10/17/18.
//  Copyright © 2018 Will Xu . All rights reserved.
//

import UIKit

class AddScheduleViewController: UITableViewController {

    var schedTypes = ["Netflix", "Hulu", "Amazon", "Spotify"]
    var myIndex = 0
    var maxHoursReservable =  0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(save))
        tableView.cellForRow(at: IndexPath(row: 0, section: 0))?.accessoryType = .checkmark
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        if (section == 0) {
            return 4
        }
        return 2
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: IndexPath(row: 0, section: 0))?.accessoryType = .none
        tableView.cellForRow(at: IndexPath(row: 1, section: 0))?.accessoryType = .none
        tableView.cellForRow(at: IndexPath(row: 2, section: 0))?.accessoryType = .none
        tableView.cellForRow(at: IndexPath(row: 3, section: 0))?.accessoryType = .none
        
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = .checkmark
        tableView.reloadData()
        
        
        myIndex = indexPath.row
    }
    
    @objc func save(_ sender: Any) {
        APIManager.makeNewSchedule(type: schedTypes[myIndex], maxReservableHours: maxHoursReservable)
        self.navigationController?.popViewController(animated: true)
    }

    @IBAction func timeLimit(_ sender: Any) {
        let alert = UIAlertController(title: "time limit alert", message: "Set a time limit for your users", preferredStyle: .alert)
        let saveAction = UIAlertAction(title: NSLocalizedString("Save", comment: "Default action"), style: .default, handler: { _ in
            let textField = alert.textFields![0]
            print (textField.text)
        })
        let cancel = UIAlertAction(title: "Cancel", style: .destructive, handler: { (action) -> Void in })
        
        alert.addTextField { (textField: UITextField) in
            textField.keyboardAppearance = .dark
            textField.keyboardType = .numberPad
            textField.autocorrectionType = .default
            textField.placeholder = "time limit"
            textField.clearButtonMode = .whileEditing
        }
        
        alert.addAction(saveAction)
        alert.addAction(cancel)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func offLimitHours(_ sender: Any) {
        //apimanagerstuff
        
    }
    

}
