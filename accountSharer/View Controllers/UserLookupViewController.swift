//
//  UserLookupViewController.swift
//  accountSharer
//
//  Created by Will Xu  on 10/17/18.
//  Copyright © 2018 Will Xu . All rights reserved.
//

import UIKit
import Parse

class UserLookupViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var results: [PFUser] = []
    var selectedUser: PFUser!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.searchBar.delegate = self
        self.searchBar.becomeFirstResponder()
        // Do any additional setup after loading the view.
    }
    
    func getResults(searchString: String) {
        APIManager.getResults(searchString: searchString) {(result: [PFObject]?, error: Error?) in
            if let result = result {
                self.results = result as! [PFUser]
                self.tableView.reloadData()
            }
        }
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.getResults(searchString: searchBar.text!.lowercased())
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = results[indexPath.row]
        self.selectedUser = user
        if (user.objectId == PFUser.current()!.objectId) {
            self.performSegue(withIdentifier: "toSchedule", sender: nil)
        } else {
            self.performSegue(withIdentifier: "toProfile", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "toProfile") {
            let destVC = segue.destination as! ScheduleViewController
            destVC.user = selectedUser
            destVC.title = selectedUser.username! + "'s Schedules"
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "resultCell", for: indexPath) as! resultCell
        cell.user = results[indexPath.row]
        return cell
    }

}
