//
//  ForumViewController.swift
//  Teddit
//
//  Created by prk on 12/22/22.
//

import UIKit

class TopicViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var imgTopicLogo: UIImageView!
    @IBOutlet var lblTopicName: UILabel!
    @IBOutlet var lblTopicDesc: UILabel!
    @IBOutlet var vTopicHeaderContainer: UIView!
    @IBOutlet var tblTopicPosts: UITableView!
    
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
        
        imgTopicLogo.image = UIImage(named: "\(topic!.image!)")
        imgTopicLogo.setRound()
        lblTopicName.text = "t/\(topic!.name!)"
        lblTopicDesc.text = topic!.desc
        
        tblTopicPosts.dataSource = self
        tblTopicPosts.delegate = self

        view.addSubview(floatAddButton)
        floatAddButton.addTarget(self, action: #selector(onPencilBtnPressed), for: .touchUpInside)
        
        vTopicHeaderContainer.layer.shadowColor = UIColor.lightGray.cgColor
        vTopicHeaderContainer.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        vTopicHeaderContainer.layer.shadowOpacity = 0.1
        vTopicHeaderContainer.layer.cornerRadius = 10
        
        self.refreshForum()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        self.refreshForum()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        floatAddButton.frame = CGRect(x: view.frame.size.width - 80, y: view.frame.size.height - 90, width: 50, height: 50)
    }
    
    func refreshForum() {
        postList = topic!.posts!.allObjects as! [Post]
        postList.sort(by: { $0.comments!.count > $1.comments!.count })
        tblTopicPosts.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblTopicPosts.dequeueReusableCell(withIdentifier: "post_cell", for: indexPath) as! PostItemTableViewCell
        
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
    
    @objc private func onPencilBtnPressed(){
        self.performSegue(withIdentifier: "toCreatePost", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch segue.identifier {
        case "toCreatePost":
            let dest = segue.destination as! CreateEditPostViewController
            dest.topic = topic!
            dest.lblPageTitle.text = "Create a post"
            
            break
        case "toPost":
            let dest = segue.destination as! PostViewController
            dest.post = postList[selectedRow!]
            
            break
        default:
            return
        }
    }
    
    @IBAction func unwindToTopic(_ unwindSegue: UIStoryboardSegue) {
        self.refreshForum()
    }
}
