//
//  Codeable.swift
//  Teddit
//
//  Created by prk on 1/5/23.
//

import Foundation

struct UserCoded: Codable {
    
    var email: String
    var username: String
    
}

class AuthUtils {
    
    static func storeUser(_ user: User) {
        let userCoded = UserCoded(email: user.email!, username: user.username!)
        let data = try! JSONEncoder().encode(userCoded)
        
        UserDefaults.standard.set(data, forKey: Constants.CURRENT_USER_KEY)
    }
    
    static func getUser() -> UserCoded? {
        let data = UserDefaults.standard.data(forKey: Constants.CURRENT_USER_KEY)
        if data == nil {
            return nil
        }
        
        return try! JSONDecoder().decode(UserCoded.self, from: data!)
    }
    
    static func getActualUser() -> User? {
        let codedUser = getUser()
        if codedUser == nil {
            return nil
        }
        
        let repo = UserRepository()
        let user = try? repo.findByEmail(email: codedUser!.email)
        if user == nil {
            return nil
        }
        
        return user
    }
    
}
