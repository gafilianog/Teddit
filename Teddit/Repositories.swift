//
//  Repositories.swift
//  Teddit
//
//  Created by prk on 12/15/22.
//

import Foundation

class UserRepository : BaseRepository<User> {
    
    init() {
        super.init(entityName: "User")
    }
    
}
