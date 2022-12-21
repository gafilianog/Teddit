//
//  ViewController.swift
//  Teddit
//
//  Created by prk on 14/12/22.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var usernameField: UITextField!
    @IBOutlet var passwordField: UITextField!
    
    var userRepo: UserRepository!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userRepo = UserRepository()
    }
    
    @IBAction func unwindToLogin(_ unwindSegue: UIStoryboardSegue) {}
    
    @IBAction func loginPressed(_ sender: Any) {
        let alertTitle = "Validation Error"
        
        let username = usernameField.text!
        let password = passwordField.text!
        
//        if username.isEmpty {
//            self.showAlert(title: alertTitle, message: "Username cannot be empty.")
//            return
//        }
//        if password.isEmpty {
//            self.showAlert(title: alertTitle, message: "Password cannot be empty.")
//            return
//        }
//
//        do {
//            let authAlertTitle = "Authentication Error"
//            if let entity = try userRepo.findByUsername(username: username) {
//                if entity.password != password {
//                    self.showAlert(title: authAlertTitle, message: "Password is incorrect.")
//                    return
//                }
//
//                // TODO: save logged in user data
//                self.showAlert(title: "Success", message: "Authentication successful.", onOkHandler: {
//                    self.performSegue(withIdentifier: "loginSuccess", sender: self)
//                })
//            } else {
//                self.showAlert(title: authAlertTitle, message: "This username is not registered.")
//                return
//            }
//        } catch {
//            print("Cannot fetch for user entity: \(error)")
//        }
        performSegue(withIdentifier: "loginSuccess", sender: self)
    }
    
}

