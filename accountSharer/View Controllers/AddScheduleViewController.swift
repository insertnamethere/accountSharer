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
    var mySched = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(save))
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
        mySched = schedTypes[myIndex]
     
        
    }
    
    @objc func save(_ sender: Any) {
        APIManager.makeNewSchedule(type: mySched)
    }



}
