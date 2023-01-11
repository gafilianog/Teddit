//
//  PostViewController.swift
//  Teddit
//
//  Created by prk on 06/01/23.
//

import UIKit

class PostViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet var vHeaderContainer: UIView!
    @IBOutlet var imgSubLogo: UIImageView!
    @IBOutlet var vFooterContainer: UIView!
    @IBOutlet var btnAddComment: UIButton!
    @IBOutlet var tblComments: UITableView!
    
    var commentList = [
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In eu semper leo. Proin maximus augue non est placerat sodales. Maecenas in pharetra tellus, a venenatis orci.",
        "Vivamus sed nisi ut justo luctus ornare. Morbi non ex quis tortor tristique molestie.\n\nDonec in interdum velit, nec dictum nisi. Aenean et odio eleifend, maximus lectus et, ullamcorper diam. Ut molestie enim ut imperdiet commodo.\n\nPraesent sit amet turpis quis augue euismod dapibus. Nulla dapibus tempor purus vel vestibulum.",
        "Sed eu hendrerit nulla.",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In eu semper leo. Proin maximus augue non est placerat sodales. Maecenas in pharetra tellus, a venenatis orci.",
        "Vivamus sed nisi ut justo luctus ornare. Morbi non ex quis tortor tristique molestie.\nDonec in interdum velit, nec dictum nisi. Aenean et odio eleifend, maximus lectus et, ullamcorper diam. Ut molestie enim ut imperdiet commodo.\nPraesent sit amet turpis quis augue euismod dapibus. Nulla dapibus tempor purus vel vestibulum.",
        "Sed eu hendrerit nulla."
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tblComments.dataSource = self
        
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
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commentList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let commentCell = tblComments.dequeueReusableCell(withIdentifier: "comment_cell", for: indexPath) as! CommentItemTableViewCell
        
        commentCell.configure(username: "john_doe", comment: commentList[indexPath.row])
        
        return commentCell
    }
}
