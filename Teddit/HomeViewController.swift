//
//  HomeViewController.swift
//  Teddit
//
//  Created by prk on 14/12/22.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tvTopics: UITableView!
    var topicRepo: TopicRepository!
    var topicList: [Topic]!
    var selectedRow: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tvTopics.dataSource = self
        tvTopics.delegate = self
        topicRepo = TopicRepository()
        
        topicList = try? topicRepo.getAll()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.refreshTable()
    }
    
    func refreshTable() {
        topicList = try? topicRepo.getAll()
        tvTopics.reloadData()
    }
    
    @IBAction func actLogOut(_ sender: Any) {
        // TODO: clear logged in user data
        performSegue(withIdentifier: "logout", sender: self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topicList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tvTopics.dequeueReusableCell(withIdentifier: "topicCell", for: indexPath) as! TopicItemTableViewCell
        
        cell.imgTopicImage.image = UIImage(named: topicList[indexPath.row].image!)
        cell.lblTopicName.text = topicList[indexPath.row].name!
        cell.lblTopicDesc.text = topicList[indexPath.row].desc!
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        selectedRow = row
        
        self.performSegue(withIdentifier: "toForum", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toForum" {
            let dest = segue.destination as! ForumViewController
            let currentTopic = topicList[selectedRow!]
            
            dest.topic = currentTopic
        }
    }

}
