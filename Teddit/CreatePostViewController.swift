//
//  CreatePostViewController.swift
//  Teddit
//
//  Created by prk on 15/12/22.
//

import UIKit

class CreatePostViewController: UIViewController, UITextViewDelegate {

    @IBOutlet var tfTitlePost: UITextField!
    @IBOutlet var tvBodyPost: UITextView!
    
    let PLACEHOLDER = "body post"
    var isFocusTv = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tvBodyPost.delegate = self
        tvBodyPost.text = PLACEHOLDER
        tvBodyPost.textColor = .lightGray
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
