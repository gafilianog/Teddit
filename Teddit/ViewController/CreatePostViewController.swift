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
    @IBOutlet var btnPost: UIButton!

    var topic: Topic?
    let postRepo = PostRepository()
    
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
    
    // TODO: enable button when title not empty
    @IBAction func onTitleChange(_ sender: Any) {
        btnPost.isEnabled = tfPostTitle.hasText
    }
    
    @IBAction func actPost(_ sender: Any) {
        let alertTitle = "Validation Error"
        
        let title = tfPostTitle.text!
        let content = tvPostBody.text!
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
