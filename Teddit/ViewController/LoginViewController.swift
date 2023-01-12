//
//  ViewController.swift
//  Teddit
//
//  Created by prk on 14/12/22.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var tfUsername: UITextField!
    @IBOutlet var tfPassword: UITextField!
    
    var userRepo: UserRepository!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userRepo = UserRepository()
        
        // temporary default user
        var adminEntity = try? userRepo.findByUsername(username: "admin")
        if adminEntity == nil {
            adminEntity = userRepo.create()
            
            adminEntity!.username = "admin"
            adminEntity!.email = "admin@mail.com"
            adminEntity!.password = "admin"
            
            do {
                try userRepo.save(entity: adminEntity!)
            } catch {
                print("Cannot create default entity called 'admin': \(error)")
            }
        }
    }
    
    @IBAction func onLoginBtnPressed(_ sender: Any) {
        let alertTitle = "Validation Error"
        
        let username = tfUsername.text!
        let password = tfPassword.text!
        
        if username.isEmpty {
            self.showAlert(title: alertTitle, message: "Username cannot be empty.")
            return
        }
        
        if password.isEmpty {
            self.showAlert(title: alertTitle, message: "Password cannot be empty.")
            return
        }

        do {
            let authAlertTitle = "Authentication Error"
            if let entity = try userRepo.findByUsername(username: username) {
                if entity.password != password {
                    self.showAlert(title: authAlertTitle, message: "Password is incorrect.")
                    return
                }
                
                AuthUtils.storeUser(entity)
                self.showAlert(title: "Success", message: "You have successfully logged in!", onOkHandler: {
                    self.tfUsername.text = ""
                    self.tfPassword.text = ""
                    
                    self.performSegue(withIdentifier: "toHome", sender: self)
                })
            } else {
                self.showAlert(title: authAlertTitle, message: "This username is not registered.")
                return
            }
        } catch {
            print("Cannot fetch for user entity: \(error)")
        }
    }
    
    @IBAction func unwindToLogin(_ unwindSegue: UIStoryboardSegue) {}
}

