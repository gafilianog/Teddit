//
//  Comment+CoreDataProperties.swift
//  Teddit
//
//  Created by prk on 12/18/22.
//
//

import Foundation
import CoreData


extension Comment {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Comment> {
        return NSFetchRequest<Comment>(entityName: "Comment")
    }

    @NSManaged public var content: String?
    @NSManaged public var author: User?
    @NSManaged public var post: Post?

}

extension Comment : Identifiable {

}
