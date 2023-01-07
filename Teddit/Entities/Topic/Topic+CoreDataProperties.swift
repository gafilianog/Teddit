//
//  Topic+CoreDataProperties.swift
//  Teddit
//
//  Created by prk on 12/18/22.
//
//

import Foundation
import CoreData


extension Topic {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Topic> {
        return NSFetchRequest<Topic>(entityName: "Topic")
    }

    @NSManaged public var name: String?
    @NSManaged public var image: String?
    @NSManaged public var desc: String?
    @NSManaged public var posts: NSSet?

}

// MARK: Generated accessors for posts
extension Topic {

    @objc(addPostsObject:)
    @NSManaged public func addToPosts(_ value: Post)

    @objc(removePostsObject:)
    @NSManaged public func removeFromPosts(_ value: Post)

    @objc(addPosts:)
    @NSManaged public func addToPosts(_ values: NSSet)

    @objc(removePosts:)
    @NSManaged public func removeFromPosts(_ values: NSSet)

}

extension Topic : Identifiable {

}
