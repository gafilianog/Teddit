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
    var postTitle = ""
    var postContent = ""
    var btnTitle = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tvPostContent.delegate = self
        
        lblPageTitle.text = pageTitle
        tfPostTitle.text = postTitle
        tvPostContent.text = postContent
        btnPost.titleLabel!.text = btnTitle
    }
    
    func textViewDidChange(_ textView: UITextView) {
        lblFakePlaceholder.isHidden = !tvPostContent.text.isEmpty
    }
    
    @IBAction func onTitleChange(_ sender: Any) {
        btnPost.isEnabled = tfPostTitle.hasText
    }
    
    @IBAction func onPostEditBtnPressed(_ sender: Any) {
        
        // TODO: After edit back to PostViewController; unwind identifier: "afterEdit:
        
        
        let alertTitle = "Validation Error"
        
        let title = tfPostTitle.text!
        let content = tvPostContent.text!
        let author = AuthUtils.getActualUser()!
        
        if title.isEmpty {
            return self.showAlert(title: alertTitle, message: "Post title cannot be empty.")
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
            print("Failed to register user: \(error)")
        }
    }
    
}
