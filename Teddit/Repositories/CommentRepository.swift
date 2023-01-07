//
//  CommentRepository.swift
//  Teddit
//
//  Created by prk on 1/7/23.
//

import Foundation

class CommentRepository: BaseRepository<Comment> {
    
    init() {
        super.init(entityName: "Comment")
    }
    
}
