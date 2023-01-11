//
//  AddCommentViewController.swift
//  Teddit
//
//  Created by prk on 10/01/23.
//

import UIKit

class CreateCommentViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var lblFakePlaceholder: UILabel!
    @IBOutlet var tvCommentSection: UITextView!
    
    
    // TODO: enable comment button when tvCommentSection not empty
    // TODO: insert comment to data core
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tvCommentSection.delegate = self
    }
    
    func textViewDidChange(_ textView: UITextView) {
        lblFakePlaceholder.isHidden = !tvCommentSection.text.isEmpty
    }
    
    @IBAction func actComment(_ sender: Any) {
        // Post comment
        // unwind identifier: "toPost"
    }
}
