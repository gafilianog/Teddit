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
        //save to new topic
        let entity = topicRepo.create()
        entity.name = nameTxt
        entity.desc = descTxt
        entity.image = "sublogo"
        
        do{
            try topicRepo.save(entity: entity)
        }catch{
            print("Failed to add new topic")
        }
    }
    //    func textViewDidChange(_ textView: UITextView) {
//        if !textView.text.isEmpty && !isFocusTv {
//            tvBodyPost.text = "" + textView.text
//            isFocusTv = true
//            tvBodyPost.textColor = .black
//        }
//    }
    
//    func textViewDidBeginEditing(_ textView: UITextView) {
//        if tvBodyPost.textColor == .lightGray {
//            tvBodyPost.text = ""
//            tvBodyPost.textColor = .black
//        }
//    }
    
//    func textViewDidEndEditing(_ textView: UITextView) {
//        if tvBodyPost.text == "" {
//            tvBodyPost.text = PLACEHOLDER
//            tvBodyPost.textColor = .lightGray
//        }
//    }
}
