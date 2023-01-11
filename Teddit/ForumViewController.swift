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
    var selectedRow: Int?
    
    private let floatAddButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 10
        button.backgroundColor = UIColor(red: 255.0 / 255.0, green: 69.0 / 255.0, blue: 0.0, alpha: 1.0)
        
        button.setImage(UIImage(systemName: "pencil", withConfiguration: UIImage.SymbolConfiguration(pointSize: 32, weight: .medium)), for: .normal)

        button.tintColor = .white

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
        tvForumPost.delegate = self

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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedRow = indexPath.row
        self.performSegue(withIdentifier: "toPost", sender: self)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        floatAddButton.frame = CGRect(x: view.frame.size.width - 80, y: view.frame.size.height - 90, width: 50, height: 50)
    }
    
    @objc private func plusPressed(){
        self.performSegue(withIdentifier: "toCreatePost", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch segue.identifier {
        case "toCreatePost":
            let dest = segue.destination as! CreatePostViewController
            dest.topic = topic!
            
            break
        case "toPost":
            let dest = segue.destination as! PostViewController
            dest.post = postList[selectedRow!]
            
            break
        default:
            return
        }
    }
    
    func refreshForum() {
        postList = topic!.posts!.allObjects as! [Post]
        postList.sort(by: { $0.comments!.count > $1.comments!.count })
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
