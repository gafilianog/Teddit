//
//  TopicRepository.swift
//  Teddit
//
//  Created by prk on 12/21/22.
//

import Foundation

class TopicRepository: BaseRepository<Topic> {
    
    init() {
        super.init(entityName: "Topic")
    }
    
    func findByName(name: String) throws -> Topic? {
        let req = Topic.fetchRequest()
        req.predicate = NSPredicate(format: "name = %@", name)
        
        let res = try context.fetch(req)
        if res.isEmpty {
            return nil
        }
        
        return res[0]
    }
    
}
