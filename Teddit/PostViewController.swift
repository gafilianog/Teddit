//
//  PostViewController.swift
//  Teddit
//
//  Created by prk on 14/12/22.
//

import UIKit

class PostViewController: UIViewController {

    @IBOutlet var imgSubLogo: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imgSubLogo.setRound()
        // Do any additional setup after loading the view.
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
