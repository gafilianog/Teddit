//
//  PostItemTableViewCell.swift
//  Teddit
//
//  Created by prk on 05/01/23.
//

import UIKit

class PostItemTableViewCell: UITableViewCell {

    @IBOutlet var vCardContainer: UIView!
    @IBOutlet var lblUsername: UILabel!
    @IBOutlet var lblPostTitle: UILabel!
    @IBOutlet var lblCommentCount: UILabel!
    
    func configure(username: String, title: String, commentCount: Int) {
        
        lblUsername.text = "Posted by u/\(username)"
        lblPostTitle.text = title
        lblCommentCount.text = String(commentCount)
        
        vCardContainer.layer.shadowColor = UIColor.lightGray.cgColor
        vCardContainer.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        vCardContainer.layer.shadowOpacity = 0.1
        vCardContainer.layer.cornerRadius = 10
    }

}
