//
//  CommentItemTableViewCell.swift
//  Teddit
//
//  Created by prk on 10/01/23.
//

import UIKit

class CommentItemTableViewCell: UITableViewCell {

    @IBOutlet var vCommentContainer: UIView!
    @IBOutlet var lblUsername: UILabel!
    @IBOutlet var lblComment: UILabel!
    
    func configure(username: String, comment: String) {
        
        lblUsername.text = username
        lblComment.text = comment
        
        vCommentContainer.layer.shadowColor = UIColor.lightGray.cgColor
        vCommentContainer.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        vCommentContainer.layer.shadowOpacity = 0.1
        vCommentContainer.layer.cornerRadius = 10
    }
}
