//
//  AddAccountViewController.swift
//  accountSharer
//
//  Created by Will Xu  on 10/17/18.
//  Copyright © 2018 Will Xu . All rights reserved.
//

import UIKit

class AddScheduleViewController: UITableViewController {

    var schedTypes = ["Netflix", "Hulu", "Amazon Prime", "Spotify"]
    var myIndex = 0
    var mySched = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    
   // @IBAction func donePressed(_ sender: Any) {
      //  APIManager.makeNewSchedule(type: accountTypeLabel.text!)
  //  }
    
    
    
   //Pretty sure we dont want this to actually happen - we want to click on it and then it checks off
    // add check marks when the cell is chosen -
    //add in the rules - 1.  max amoutn of time someone can reserve - off limit hours
    //create a "create account button at the bottom to officially make the account
    /*@IBAction func chooseNetflix(_ sender: Any) {
        APIManager.makeNewSchedule(type: "Netflix")
    }
    @IBAction func chooseHulu(_ sender: Any) {
        APIManager.makeNewSchedule(type: "Hulu")
    }
    @IBAction func chooseAmazon(_ sender: Any) {
        APIManager.makeNewSchedule(type: "Amazon Prime")
    }
    @IBAction func chooseSpotify(_ sender: Any) {
        APIManager.makeNewSchedule(type: "Spotify")
    }*/
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }
//
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if (section == 0) {
            return 4 //this is netflix, hulu, amazon prime, and spotify
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
        
    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
//        cell.textLabel?.text = schedTypes[indexPath.row]
//
//        return cell
//    }
//
//
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let cell = tableView.cellForRow(at: indexPath)
//        cell?.accessoryType = UITableViewCell.AccessoryType.checkmark
//        mySched = schedTypes[indexPath.row]
//
//    }
//
//
//    // make IBAction function for each of the
//
//    //max amount of time someone can reserve
//    //off limit hours
//
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
//    */

}
