//
//  UIViewController+ShowAlert.swift
//  Teddit
//
//  Created by prk on 12/18/22.
//

import Foundation
import UIKit

extension UIViewController {
    
    func showAlert(title: String, message: String) {
        let alertView = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alertView.addAction(UIAlertAction(title: "OK", style: .default))
        
        self.present(alertView, animated: true)
    }
    
}
