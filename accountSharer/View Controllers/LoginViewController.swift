//
//  ViewController.swift
//  accountSharer
//
//  Created by Will Xu  on 10/16/18.
//  Copyright © 2018 Will Xu . All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var usernameField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func signupPressed(_ sender: Any) {
        self.registerUser()
    }
    
    @IBAction func loginPressed(_ sender: Any) {
        self.loginUser()
    }
    
    func registerUser() {
        APIManager.registerUser(username: usernameField.text!, password: passwordField.text!) { (success: Bool, error: Error?) in
            if let error = error {
                print(error.localizedDescription)
                APIManager.showAlert(title: error.localizedDescription, message: "", controller: self)
            } else {
                print("User Registered successfully")
                self.performSegue(withIdentifier: "toHome", sender: nil)
            }
        }
    }
    
    func loginUser() {
        APIManager.loginUser(username: usernameField.text!, password: passwordField.text!) { (user: PFUser?, error: Error?) in
            if let error = error {
                print("User log in failed: \(error.localizedDescription)")
                APIManager.showAlert(title: error.localizedDescription, message: "", controller: self)
            } else {
                print("User logged in successfully")
                self.performSegue(withIdentifier: "toHome", sender: nil)
            }
        }
    }
}

