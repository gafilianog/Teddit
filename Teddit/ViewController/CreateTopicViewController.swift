//
//  CreatePostViewController.swift
//  Teddit
//
//  Created by prk on 15/12/22.
//

import UIKit

class CreateTopicViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet var tfTopicDesc: UITextField!
    @IBOutlet var tfTopicName: UITextField!
    @IBOutlet var btnCreateTopic: UIButton!

    var nameIsEmpty = true
    var descIsEmpty = true
    var topicRepo: TopicRepository!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topicRepo = TopicRepository()
    }
    
    @IBAction func onTopicNameFieldChanged(_ sender: Any) {
        nameIsEmpty = tfTopicName.text!.isEmpty
        btnCreateTopic.isEnabled = !nameIsEmpty && !descIsEmpty
    }
    
    @IBAction func onTopicDescFieldChanged(_ sender: Any) {
        descIsEmpty = tfTopicDesc.text!.isEmpty
        btnCreateTopic.isEnabled = !nameIsEmpty && !descIsEmpty
    }
    
    @IBAction func onCreateTopicBtnPressed(_ sender: Any) {
        let nameTxt: String = tfTopicName.text!
        let descTxt: String = tfTopicDesc.text!
        
        let alertTitle = "Validation Error"
        for char in nameTxt {
            if char == "_" {
                continue
            }
            if char == " " {
                self.showAlert(title: alertTitle, message: "Topic name cannot use space, use '_' to separate between words or combine them.")
                return
            }
            
            if !char.isLetter && !char.isNumber {
                self.showAlert(title: alertTitle, message: "Topic name cannot use any special characters.")
                return
            }
        }
        
        let foundTopic = try? topicRepo.findByName(name: nameTxt)
        if foundTopic != nil {
            self.showAlert(title: alertTitle, message: "This topic has already existed.")
            return
        }
        
        let entity = topicRepo.create()
        entity.name = nameTxt
        entity.desc = descTxt
        entity.image = "default_sub_logo"
        
        do{
            try topicRepo.save(entity: entity)
        }catch{
            print("Failed to add new topic")
        }
        
        tfTopicName.text = ""
        tfTopicDesc.text = ""
        btnCreateTopic.isEnabled = false
        
        performSegue(withIdentifier: "toHome", sender: self)
    }
}
