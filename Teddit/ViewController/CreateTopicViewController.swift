//
//  CreatePostViewController.swift
//  Teddit
//
//  Created by prk on 15/12/22.
//

import UIKit

class CreateTopicViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var DescTxt: UITextField!
    @IBOutlet weak var NameTxt: UITextField!
    @IBOutlet weak var CreateTopicButton: UIButton!

    var nameIsEmpty = true
    var descIsEmpty = true
    var topicRepo: TopicRepository!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topicRepo = TopicRepository()
    }
    
    @IBAction func NameChanged(_ sender: Any) {
        nameIsEmpty = NameTxt.text!.isEmpty
        CreateTopicButton.isEnabled = !nameIsEmpty && !descIsEmpty
    }
    
    @IBAction func DescChanged(_ sender: Any) {
        descIsEmpty = DescTxt.text!.isEmpty
        CreateTopicButton.isEnabled = !nameIsEmpty && !descIsEmpty
    }
    
    @IBAction func CreateTopicPressed(_ sender: Any) {
        let nameTxt: String = NameTxt.text!
        let descTxt: String = DescTxt.text!
        //nantinya gambar topic bisa di upload juga
        
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
        
        NameTxt.text = ""
        DescTxt.text = ""
        CreateTopicButton.isEnabled = false
        
        performSegue(withIdentifier: "toHome", sender: self)
        
//        let delegate = self.tabBarController as! ChangeTabDelegate
//        delegate.changeTo(tabIndex: 0)
    }

}
