//
//  UIImageView+CircularImage.swift
//  Teddit
//
//  Created by prk on 14/12/22.
//

import Foundation
import UIKit

extension UIImageView {
    
    func setRound() {
        layer.borderWidth = 1
        layer.masksToBounds = false
        layer.borderColor = UIColor(red: 255.0 / 255.0, green: 69.0 / 255.0, blue: 0.0, alpha: 1.0).cgColor
        layer.cornerRadius = self.frame.width / 2
        clipsToBounds = true
    }
}
