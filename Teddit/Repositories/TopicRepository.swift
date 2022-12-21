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
    
}
