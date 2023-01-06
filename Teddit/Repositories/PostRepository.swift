//
//  PostRepository.swift
//  Teddit
//
//  Created by prk on 1/6/23.
//

import UIKit

class PostRepository: BaseRepository<Post> {

    init() {
        super.init(entityName: "Post")
    }
    
}
