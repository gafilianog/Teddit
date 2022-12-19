//
//  User+CoreDataProperties.swift
//  Teddit
//
//  Created by prk on 12/18/22.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var email: String?
    @NSManaged public var password: String?
    @NSManaged public var username: String?

}

extension User : Identifiable {

}
