//
//  PostViewController.swift
//  Teddit
//
//  Created by prk on 06/01/23.
//

import UIKit

class PostViewController: UIViewController, UITableViewDataSource {
    
    var post: Post?
    var commentList = [Comment]()
    
    @IBOutlet var vHeaderContainer: UIView!
    @IBOutlet var imgSubLogo: UIImageView!
    @IBOutlet var vFooterContainer: UIView!
    @IBOutlet var btnAddComment: UIButton!
    @IBOutlet var tblComments: UITableView!
    
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var lblTopic: UILabel!
    @IBOutlet var lblAuthor: UILabel!
    @IBOutlet var lblContent: UILabel!
    @IBOutlet var lblCommentCount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.tintColor = UIColor(red: 255.0 / 255.0, green: 69.0 / 255.0, blue: 0.0, alpha: 1.0)
        
        tblComments.dataSource = self
        
        imgSubLogo.image = UIImage(named: "\(post!.topic!.image!)")
        
        imgSubLogo.setRound()
        
        vHeaderContainer.layer.shadowColor = UIColor.lightGray.cgColor
        vHeaderContainer.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        vHeaderContainer.layer.shadowOpacity = 0.1
        vHeaderContainer.layer.cornerRadius = 20
        
        vFooterContainer.layer.shadowColor = UIColor.lightGray.cgColor
        vFooterContainer.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        vFooterContainer.layer.shadowOpacity = 0.1
        vFooterContainer.layer.cornerRadius = 20
        
        btnAddComment.contentHorizontalAlignment = .leading
        
        lblTitle.text = post!.title
        lblTopic.text = "t/\(post!.topic!.name!)"
        lblAuthor.text = "u/\(post!.author!.username!)"
        lblContent.text = post!.content
        
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toCreateComment" {
            let dest = segue.destination as! CreateCommentViewController
            dest.post = post
        }
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        <#code#>
//    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        self.refreshPost()
//    }
    
//    override func viewDidLayoutSubviews() {
//        self.refreshPost()
//    }
    
    @IBAction func unwindToPost(_ unwindSegue: UIStoryboardSegue) {
        self.refreshPost()
    }
    
}
