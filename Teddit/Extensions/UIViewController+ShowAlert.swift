//
//  UIViewController+ShowAlert.swift
//  Teddit
//
//  Created by prk on 12/18/22.
//

import Foundation
import UIKit

extension UIViewController {
    
    func showAlert(title: String, message: String, onOkHandler: (() -> Void)? = nil) {
        let alertView = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alertView.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in onOkHandler?() }))
        
        self.present(alertView, animated: true)
    }
    
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}
