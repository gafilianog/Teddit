//
//  ForumViewController.swift
//  Teddit
//
//  Created by prk on 12/22/22.
//

import UIKit

class ForumViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var imgSubBanner: UIImageView!
    @IBOutlet var imgSubLogo: UIImageView!
    @IBOutlet var tvForumPost: UITableView!
    
    let titles = ["If elevators hadn't been invented, all the CEOs and important people would have their offices on the first floor as a sign of status.", "If elevators hadn't been invented, all the CEOs.", "If elevators hadn't been invented, all the CEOs and important people would have their offices on the first floor as a sign of status. If elevators hadn't been invented, all the CEOs and important people.", "If elevators hadn't been invented, all the CEOs and important people would have their offices on the first floor as a sign of status.", "If elevators hadn't been invented, all the CEOs.", "If elevators hadn't been invented, all the CEOs and important people would have their offices on the first floor as a sign of status. If elevators hadn't been invented, all the CEOs and important people."]
    let usernames = ["john_doe", "jane_doe", "pakerte", "john_doe", "jane_doe", "pakerte"]
    let commentCounts = [100, 0, 9999, 100, 0, 9999]
    
    private let floatAddButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 0.5 * button.bounds.size.width
        button.backgroundColor = .blue

        button.setImage(UIImage(systemName: "plus", withConfiguration: UIImage.SymbolConfiguration(pointSize: 32, weight: .medium)), for: .normal)

        button.tintColor = .white
        button.setTitleColor(.white, for: .normal)

        button.layer.shadowRadius = 10
        button.layer.shadowOpacity = 0.2

        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgSubLogo.setRound()
        tvForumPost.dataSource = self

        view.addSubview(floatAddButton)
        floatAddButton.addTarget(self, action: #selector(plusPressed), for: .touchUpInside)
        
        
        // Do any additional setup after loading the view.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usernames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tvForumPost.dequeueReusableCell(withIdentifier: "post_cell", for: indexPath) as! PostItemTableViewCell
        
        cell.configure(username: usernames[indexPath.row], title: titles[indexPath.row], commentCount: commentCounts[indexPath.row])
        
        return cell
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        floatAddButton.frame = CGRect(x: view.frame.size.width - 80, y: view.frame.size.height - 90, width: 50, height: 50)
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
