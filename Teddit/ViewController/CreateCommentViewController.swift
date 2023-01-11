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
    @IBOutlet var btnComment: UIButton!
    
    var post: Post?
    let commentRepo = CommentRepository()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tvCommentSection.delegate = self
        lblTitle.text = post!.title!
    }
    
    func textViewDidChange(_ textView: UITextView) {
        lblFakePlaceholder.isHidden = !tvCommentSection.text.isEmpty
        btnComment.isEnabled = !tvCommentSection.text.isEmpty
    }
    
    @IBAction func actComment(_ sender: Any) {
        let comment = commentRepo.create()
        
        comment.content = tvCommentSection.text!
        comment.author = AuthUtils.getActualUser()
        
        post!.addToComments(comment)
        do {
            try commentRepo.save(entity: comment)
        } catch {
            print("Cannot save entity to database: \(error)")
        }
        
        self.performSegue(withIdentifier: "toPost", sender: self)
    }
    
}
