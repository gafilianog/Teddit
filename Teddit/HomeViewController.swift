//
//  HomeViewController.swift
//  Teddit
//
//  Created by prk on 14/12/22.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tblPosts: UITableView!
    
    let userList = ["john_doe", "pant8_researcher", "galvanicho"]
    let titleList = ["Lorem Ipsum", "Lipsum", "Bocchi the Rock"]
    let contentList = ["Donec facilisis mi sed dui aliquam tempor. Maecenas posuere aliquet faucibus. Donec pulvinar feugiat lobortis. Nullam porttitor enim in porttitor pulvinar. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nam vitae pretium nibh. Aenean convallis libero a arcu cursus elementum.", "Maecenas sed finibus tortor, non cursus metus. Nulla volutpat et nisl vitae rhoncus. Nunc vehicula consequat aliquam. In accumsan odio quam, ut eleifend nisl imperdiet a. Vivamus ac risus tellus. Curabitur risus ligula, faucibus eu efficitur non, tincidunt tincidunt sem. Curabitur elementum facilisis diam, et placerat nisi efficitur vitae. Maecenas sit amet mattis libero. Vestibulum risus libero, placerat a mattis non, pellentesque ut justo.", "Ut dictum vel sapien a venenatis. Fusce venenatis leo at mauris vehicula, sit amet gravida sapien rhoncus. Vivamus ut felis lacus. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nam magna nulla, pulvinar a ex vitae, ornare venenatis ligula. Duis efficitur lorem cursus vulputate blandit."]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tblPosts.delegate = self
        tblPosts.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblPosts.dequeueReusableCell(withIdentifier: "cell") as! PostTableViewCell
        
        let username = userList[indexPath.row]
        let title = titleList[indexPath.row]
        let content = contentList[indexPath.row]
        
        cell.lblUsername.text = "u/" + username
        cell.lblTitle.text = title
        cell.lblBody.text = content
        
        return cell
    }
}
