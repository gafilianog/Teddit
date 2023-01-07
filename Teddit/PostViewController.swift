//
//  PostViewController.swift
//  Teddit
//
//  Created by prk on 06/01/23.
//

import UIKit

class PostViewController: UIViewController {

    
    @IBOutlet var vHeaderContainer: UIView!
    @IBOutlet var imgSubLogo: UIImageView!
    @IBOutlet var vFooterContainer: UIView!
    @IBOutlet var btnAddComment: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
