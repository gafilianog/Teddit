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
        layer.borderColor = UIColor.black.cgColor
        layer.cornerRadius = self.frame.height / 2
        clipsToBounds = true
    }
}
