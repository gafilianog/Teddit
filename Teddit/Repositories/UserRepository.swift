//
//  UserRepository.swift
//  Teddit
//
//  Created by prk on 12/18/22.
//

import Foundation
import CoreData

class UserRepository : BaseRepository<User> {
    
    init() {
        super.init(entityName: "User")
    }
    
    func findByUsername(username: String) throws -> User? {
        let req = User.fetchRequest()
        req.predicate = NSPredicate(format: "username = %@", username)
        
        return try context.fetch(req).first
    }
    
    func findByEmail(email: String) throws -> User? {
        let req = User.fetchRequest()
        req.predicate = NSPredicate(format: "email = %@", email)
        
        return try context.fetch(req).first
    }
    
}
