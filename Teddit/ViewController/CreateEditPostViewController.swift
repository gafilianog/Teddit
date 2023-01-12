//
//  CreatePostViewController.swift
//  Teddit
//
//  Created by prk on 06/01/23.
//

import UIKit

class CreateEditPostViewController: UIViewController, UITextViewDelegate {

    @IBOutlet var lblPageTitle: UILabel!
    @IBOutlet var tfPostTitle: UITextField!
    @IBOutlet var tvPostContent: UITextView!
    @IBOutlet var lblFakePlaceholder: UILabel!
    @IBOutlet var btnPost: UIButton!

    var topic: Topic?
    let postRepo = PostRepository()
    var pageTitle = ""
    var btnTitle = ""
    
    /**
     `Post` instance shouldn't be `nil` when use for editing the post.
     */
    var currentPost: Post?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tvPostContent.delegate = self
        
        lblPageTitle.text = pageTitle
        
        if currentPost != nil {
            lblFakePlaceholder.isHidden = true
            btnPost.isEnabled = true
            btnPost.setTitle(btnTitle, for: .normal)
            btnPost.setTitle(btnTitle, for: .disabled)
            
            tfPostTitle.text = currentPost!.title
            tvPostContent.text = currentPost!.content
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        lblFakePlaceholder.isHidden = !tvPostContent.text.isEmpty
    }
    
    @IBAction func onTitleChange(_ sender: Any) {
        btnPost.isEnabled = tfPostTitle.hasText
    }
    
    @IBAction func onPostEditBtnPressed(_ sender: Any) {
        let alertTitle = "Validation Error"
        
        let title = tfPostTitle.text!
        let content = tvPostContent.text!
        let author = AuthUtils.getActualUser()!
        
        if title.isEmpty {
            return self.showAlert(title: alertTitle, message: "Post title cannot be empty.")
        }
        
        if currentPost != nil {
            currentPost!.title = title
            currentPost!.content = content
            
            do {
                try postRepo.save(entity: currentPost!)
            } catch {
                print("Failed to update post: \(error)")
            }
            
            self.performSegue(withIdentifier: "afterEdit", sender: self)
            
            return
        }
        
        let post = postRepo.create()
        post.title = title
        post.content = content
        post.author = author
        
        topic!.addToPosts(post)
        do {
            try postRepo.save(entity: post)
            
            self.showAlert(title: "Post", message: "Successfully created a new post", onOkHandler: { self.performSegue(withIdentifier: "toForum", sender: self) })
        } catch {
            print("Failed to register post: \(error)")
        }
    }
    
}
