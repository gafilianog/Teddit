//
//  RegisterViewController.swift
//  Teddit
//
//  Created by prk on 14/12/22.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet var usernameField: UITextField!
    @IBOutlet var emailField: UITextField!
    @IBOutlet var passwordField: UITextField!
    
    var userRepo: UserRepository?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userRepo = UserRepository()
    }
    
    @IBAction func registerPressed(_ sender: Any) {
        let username = self.validateUsername()
        if username == nil {
            return
        }
        
        let email = self.validateEmail()
        if email == nil {
            return
        }
        
        let password = self.validatePassword()
        if password == nil {
            return
        }
    }
    
    func validateUsername() -> String? {
        let username = usernameField.text!
        let alertTitle = "Validation Error"
        
        if username.isEmpty {
            self.showAlert(title: alertTitle, message: "Username cannot be empty.")
            return nil
        }
        if username.matches(of: /^.{3,20}$/).isEmpty {
            self.showAlert(title: alertTitle, message: "Username must be more than 3 characters and less than 20 characters.")
            return nil
        }
        if (username.firstMatch(of: /[ +\-`~!@#$%^&*()\\\/=?><,.]/) != nil) {
            self.showAlert(title: alertTitle, message: "Username must not contain special characters.")
            return nil
        }
        
        do {
            let entity = try userRepo!.findByUsername(username: username)
            if entity != nil {
                self.showAlert(title: alertTitle, message: "Username is already taken.")
                return nil
            }
        } catch {
            self.showAlert(title: alertTitle, message: "Cannot fetch data from Core Data")
            return nil
        }
        
        return username
    }
    
    func validateEmail() -> String? {
        let email = emailField.text!
        let alertTitle = "Validation Error"
        
        if email.isEmpty {
            self.showAlert(title: alertTitle, message: "Email cannot be empty.")
            return nil
        }
        if email.matches(of: /^[a-z\\d_.]+@[a-zA-Z-_.]+\.[a-zA-Z]+$/).isEmpty {
            self.showAlert(title: alertTitle, message: "Email is not valid.")
            return nil
        }
        
        do {
            let entity = try userRepo!.findByEmail(email: email)
            if entity != nil {
                self.showAlert(title: alertTitle, message: "Email is already taken.")
                return nil
            }
        } catch {
            self.showAlert(title: alertTitle, message: "Cannot fetch data from Core Data")
            return nil
        }
        
        return email
    }
    
    func validatePassword() -> String? {
        let password = passwordField.text!
        let alertTitle = "Validation Error"
        
        if password.matches(of: /^.{8,16}$/).isEmpty {
            self.showAlert(title: alertTitle, message: "Password length must be 8 - 16 characters.")
            return nil
        }
        if password.matches(of: /[a-z]/).isEmpty {
            self.showAlert(title: alertTitle, message: "Password must have lowercase characters.")
            return nil
        }
        if password.matches(of: /[A-Z]/).isEmpty {
            self.showAlert(title: alertTitle, message: "Password must have uppercase characters.")
            return nil
        }
        if password.matches(of: /[+\-`~!@#$%^&*()\\\/=?><,.]/).isEmpty {
            self.showAlert(title: alertTitle, message: "Password must have special characters.")
            return nil
        }
        
        return password
    }

}
