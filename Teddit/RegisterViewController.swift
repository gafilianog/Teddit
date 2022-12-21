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
    
    var userRepo: UserRepository!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userRepo = UserRepository()
    }
    
    @IBAction func registerPressed(_ sender: Any) {
        let username, email, password: String
        
        do {
            username = try self.validateUsername()
            email = try self.validateEmail()
            password = try self.validatePassword()
        } catch let error as ValidationError {
            self.showAlert(title: "Validation Error", message: error.message)
            return
        } catch {
            return
        }
        
        let entity = userRepo.create()
        entity.email = email
        entity.username = username
        entity.password = password
        
        do {
            try userRepo.save(entity: entity)
        } catch {
            print("Failed to register user: \(error)")
        }
    }
    
    func validateUsername() throws -> String {
        let username = usernameField.text!
        if username.isEmpty {
            throw ValidationError("Username cannot be empty.")
        }
        
        if username.count < 3 || username.count > 20 {
            throw ValidationError("Username must be more than 3 characters and less than 20 characters.")
        }

        for char in username {
            if char == "_" {
                continue
            }
            
            if !char.isLetter && !char.isNumber {
                throw ValidationError("Username must not contain special characters.")
            }
        }
        
        do {
            let entity = try userRepo!.findByUsername(username: username)
            if entity != nil {
                throw ValidationError("Username is already taken.")
            }
        } catch {
            throw ValidationError("Cannot fetch data from Core Data")
        }
        
        return username
    }
    
    func validateEmail() throws -> String {
        let email = emailField.text!
        if email.isEmpty {
            throw ValidationError("Email cannot be empty.")
        }
        
        let emailSplit = email.split(separator: "@")
        if emailSplit.count != 2 {
            throw ValidationError("Email must contains '@'.")
        }
        
        for char in email {
            if char == "@" || char == "." {
                continue
            }
            if char.isUppercase {
                throw ValidationError("Email cannot have any uppercase.")
            }
            if !char.isLetter && !char.isNumber {
                throw ValidationError("Email cannot have any special characters.")
            }
        }
        
        let domain = emailSplit[1]
        if !domain.contains(".") {
            throw ValidationError("Email must have a valid domain.")
        }
        
        do {
            let entity = try userRepo!.findByEmail(email: email)
            if entity != nil {
                throw ValidationError("Email is already taken.")
            }
        } catch {
            throw ValidationError("Cannot fetch data from Core Data.")
        }
        
        return email
    }
    
    func validatePassword() throws -> String {
        let password = passwordField.text!
        
        if password.count < 8 || password.count > 16 {
            throw ValidationError("Password length must be 8 - 16 characters.")
        }
        
        var hasLower = false
        var hasUpper = false
        var hasSpecial = false
        var hasNumber = false
        
        for char in password {
            if char.isUppercase {
                hasUpper = true
            }
            if char.isLowercase {
                hasLower = true
            }
            if char.isNumber {
                hasNumber = true
            }
            if (!char.isLetter && !char.isNumber) {
                hasSpecial = true
            }
        }
        
        if !hasLower {
            throw ValidationError("Password must have lowercase characters.")
        }
        if !hasUpper {
            throw ValidationError("Password must have lowercase characters.")
        }
        if !hasNumber {
            throw ValidationError("Password must have lowercase characters.")
        }
        if !hasSpecial {
            throw ValidationError("Password must have special characters.")
        }
        
        return password
    }

}
