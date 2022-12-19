//
//  PostTableViewCell.swift
//  Teddit
//
//  Created by prk on 15/12/22.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    @IBOutlet var lblUsername: UILabel!
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var lblBody: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
