//
//  CreatePostViewController.swift
//  Teddit
//
//  Created by prk on 06/01/23.
//

import UIKit

class CreatePostViewController: UIViewController, UITextViewDelegate {

    @IBOutlet var tfPostTitle: UITextField!
    @IBOutlet var tvPostBody: UITextView!
    @IBOutlet var lblFakePlaceholder: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        tvPostBody.layer.cornerRadius = 6
//        tvPostBody.layer.borderColor = UIColor.gray.withAlphaComponent(0.3).cgColor
//        tvPostBody.layer.borderWidth = 0.5
//        tvPostBody.textColor = .lightGray
//        tvPostBody.text = "LOREM IPSUM"
        
        tvPostBody.delegate = self
    }
    
    func textViewDidChange(_ textView: UITextView) {
        lblFakePlaceholder.isHidden = !tvPostBody.text.isEmpty
//        if tvPostBody.textColor == .lightGray && tvPostBody.isFirstResponder {
//            tvPostBody.text = nil
//            tvPostBody.textColor = .black
//        }
    }
    
//    textview
    
//    func textViewDidBeginEditing(_ textView: UITextView) {
//        if tvPostBody.textColor == .lightGray && tvPostBody.isFirstResponder {
//            tvPostBody.text = nil
//            tvPostBody.textColor = .black
//        }
//    }
}
