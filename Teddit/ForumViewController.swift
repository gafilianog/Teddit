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
    
    @IBOutlet var tvTitle: UILabel!
    @IBOutlet var tvDescription: UILabel!
    
    let topicRepo = TopicRepository()
    let postRepo = PostRepository()
    
    var topic: Topic? = nil
    var postList = [Post]()
    
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
        
        tvTitle.text = "t/\(topic!.name!)"
        tvDescription.text = topic!.desc
        
        self.refreshForum()
        
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
        return postList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tvForumPost.dequeueReusableCell(withIdentifier: "post_cell", for: indexPath) as! PostItemTableViewCell
        
        let row = indexPath.row
        let currentPost = postList[row]
        
        cell.configure(
            username: currentPost.author!.username!,
            title: currentPost.title!,
            commentCount: currentPost.comments!.count
        )
        
        return cell
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        floatAddButton.frame = CGRect(x: view.frame.size.width - 80, y: view.frame.size.height - 90, width: 50, height: 50)
    }
    
    @objc private func plusPressed(){
        self.performSegue(withIdentifier: "toCreatePost", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toCreatePost" {
            let dest = segue.destination as! CreatePostViewController
            dest.topic = topic!
        }
    }
    
    func refreshForum() {
        postList = topic!.posts!.allObjects as! [Post]
        tvForumPost.reloadData()
    }
    
    @IBAction func unwindToForum(_ unwindSegue: UIStoryboardSegue) {
        self.refreshForum()
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
