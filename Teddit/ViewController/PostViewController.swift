//
//  PostViewController.swift
//  Teddit
//
//  Created by prk on 06/01/23.
//

import UIKit

class PostViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet var vHeaderContainer: UIView!
    @IBOutlet var imgTopicLogo: UIImageView!
    @IBOutlet var lblTopicName: UILabel!
    @IBOutlet var lblPostAuthor: UILabel!
    @IBOutlet var lblPostTitle: UILabel!
    @IBOutlet var lblPostContent: UILabel!
    @IBOutlet var lblCommentCount: UILabel!
    @IBOutlet var btnEdit: UIButton!
    @IBOutlet var btnDelete: UIButton!
    @IBOutlet var tblComments: UITableView!
    @IBOutlet var btnAddComment: UIButton!
    @IBOutlet var vFooterContainer: UIView!
    
    var post: Post?
    var commentList = [Comment]()
    let postRepo = PostRepository()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.tintColor = UIColor(red: 255.0 / 255.0, green: 69.0 / 255.0, blue: 0.0, alpha: 1.0)
        
        tblComments.dataSource = self
        
        vHeaderContainer.layer.shadowColor = UIColor.lightGray.cgColor
        vHeaderContainer.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        vHeaderContainer.layer.shadowOpacity = 0.1
        vHeaderContainer.layer.cornerRadius = 20
        
        imgTopicLogo.image = UIImage(named: "\(post!.topic!.image!)")
        imgTopicLogo.setRound()
        lblTopicName.text = "t/\(post!.topic!.name!)"
        lblPostAuthor.text = "u/\(post!.author!.username!)"
        lblPostTitle.text = post!.title
        lblPostContent.text = post!.content
        
        btnAddComment.contentHorizontalAlignment = .leading
        
        vFooterContainer.layer.shadowColor = UIColor.lightGray.cgColor
        vFooterContainer.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        vFooterContainer.layer.shadowOpacity = 0.1
        vFooterContainer.layer.cornerRadius = 20
        
        let currentUser = AuthUtils.getActualUser()!
        let isAuthor = (currentUser == post!.author)
        
        btnEdit.isHidden = !isAuthor
        btnDelete.isHidden = !isAuthor
        
        self.refreshPost()
    }
    
    func refreshPost() {
        commentList = post!.comments!.allObjects as! [Comment]
        lblCommentCount.text = String(commentList.count)
        tblComments.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commentList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let commentCell = tblComments.dequeueReusableCell(withIdentifier: "comment_cell", for: indexPath) as! CommentItemTableViewCell
        
        let row = indexPath.row
        let comment = commentList[row]
        
        commentCell.configure(username: comment.author!.username!, comment: comment.content!)
        
        return commentCell
    }
    
    @IBAction func onEditBtnPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "toEditPost", sender: self)
    }
    
    
    @IBAction func onDeleteBtnPressed(_ sender: Any) {
        do {
            try postRepo.delete(entity: post!)
        } catch {
            print("Failed to delete post: \(error)")
        }
        
        self.performSegue(withIdentifier: "postDeleted", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toCreateComment" {
            let dest = segue.destination as! CreateCommentViewController
            dest.post = post
        } else if segue.identifier == "toEditPost" {
            let dest = segue.destination as! CreateEditPostViewController
            dest.pageTitle = "Edit your post"
            dest.currentPost = post
            dest.btnTitle = "Edit"
        }
    }
    
    @IBAction func unwindToPost(_ unwindSegue: UIStoryboardSegue) {
        self.refreshPost()
    }
}
