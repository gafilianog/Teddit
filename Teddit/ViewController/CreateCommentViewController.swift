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
    @IBOutlet var tvCommentContent: UITextView!
    @IBOutlet var btnComment: UIButton!
    
    var post: Post?
    let commentRepo = CommentRepository()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tvCommentContent.delegate = self
        
        lblTitle.text = post!.title!
    }
    
    func textViewDidChange(_ textView: UITextView) {
        lblFakePlaceholder.isHidden = !tvCommentContent.text.isEmpty
        btnComment.isEnabled = !tvCommentContent.text.isEmpty
    }
    
    @IBAction func onCommentBtnPressed(_ sender: Any) {
        let comment = commentRepo.create()
        
        comment.content = tvCommentContent.text!
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
