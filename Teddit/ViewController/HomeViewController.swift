//
//  HomeViewController.swift
//  Teddit
//
//  Created by prk on 14/12/22.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tblTopics: UITableView!
    
    var topicRepo: TopicRepository!
    var topicList: [Topic]!
    var selectedRow: Int?
    
    private let floatAddButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 10
        button.backgroundColor = UIColor(red: 255.0 / 255.0, green: 69.0 / 255.0, blue: 0.0, alpha: 1.0)
        button.setImage(UIImage(systemName: "plus", withConfiguration: UIImage.SymbolConfiguration(pointSize: 32, weight: .medium)), for: .normal)
        button.tintColor = .white
        button.layer.shadowRadius = 10
        button.layer.shadowOpacity = 0.2

        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tblTopics.dataSource = self
        tblTopics.delegate = self
        
        topicRepo = TopicRepository()
        
        topicList = try? topicRepo.getAll()
        
        view.addSubview(floatAddButton)
        floatAddButton.addTarget(self, action: #selector(onPlusBtnPressed), for: .touchUpInside)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.refreshTable()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        floatAddButton.frame = CGRect(x: view.frame.size.width - 80, y: view.frame.size.height - 90, width: 50, height: 50)
        
        self.refreshTable()
    }
    
    func refreshTable() {
        topicList = try? topicRepo.getAll()
        tblTopics.reloadData()
    }
    
    @IBAction func onLogoutBtnPressed(_ sender: Any) {
        // TODO: clear logged in user data
        performSegue(withIdentifier: "logout", sender: self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topicList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblTopics.dequeueReusableCell(withIdentifier: "topicCell", for: indexPath) as! TopicItemTableViewCell
        
        cell.imgTopicImage.image = UIImage(named: topicList[indexPath.row].image!)
        cell.lblTopicName.text = "t/\(topicList[indexPath.row].name!)"
        cell.lblTopicDesc.text = topicList[indexPath.row].desc!
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        selectedRow = row
        
        self.performSegue(withIdentifier: "toForum", sender: self)
    }
    
    @objc private func onPlusBtnPressed() {
        self.performSegue(withIdentifier: "toCreateTopic", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toForum" {
            let dest = segue.destination as! TopicViewController
            let currentTopic = topicList[selectedRow!]
            
            dest.topic = currentTopic
        }
    }

    @IBAction func unwindToHome(_ unwindSegue: UIStoryboardSegue) {}
}
