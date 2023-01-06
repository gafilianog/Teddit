//
//  ForumViewController.swift
//  Teddit
//
//  Created by prk on 12/22/22.
//

import UIKit

class ForumViewController: UIViewController {
    
    @IBOutlet var imgSubBanner: UIImageView!
    @IBOutlet var imgSubLogo: UIImageView!
    
//    private let floatAddButton: UIButton = {
//        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
//        button.layer.masksToBounds = true
//        button.layer.cornerRadius = 30
//        button.backgroundColor = .blue
//
//        button.setImage(UIImage(systemName: "plus", withConfiguration: UIImage.SymbolConfiguration(pointSize: 32, weight: .medium)), for: .normal)
//
//        button.tintColor = .white
//        button.setTitleColor(.white, for: .normal)
//
//        button.layer.shadowRadius = 10
//        button.layer.shadowOpacity = 0.2
//
//        return button
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgSubLogo.setRound()
//        imgSubBanner.bringSubviewToFront(imgSubLogo)

//        view.addSubview(floatAddButton)
//        floatAddButton.addTarget(self, action: #selector(plusPressed), for: .touchUpInside)
        
        
        // Do any additional setup after loading the view.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
//        floatAddButton.frame = CGRect(x: view.frame.size.width - 120, y: view.frame.size.width - 120, width: 50, height: 50)
    }
    
    @objc private func plusPressed(){
        //do something
        
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
