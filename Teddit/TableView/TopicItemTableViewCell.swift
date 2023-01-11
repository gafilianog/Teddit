//
//  TopicItemTableViewCell.swift
//  Teddit
//
//  Created by prk on 12/21/22.
//

import UIKit

class TopicItemTableViewCell: UITableViewCell {

    @IBOutlet var imgTopicImage: UIImageView!
    @IBOutlet var lblTopicName: UILabel!
    @IBOutlet var lblTopicDesc: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imgTopicImage.setRound()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
