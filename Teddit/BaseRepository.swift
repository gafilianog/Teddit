//
//  BaseRepositories.swift
//  Teddit
//
//  Created by prk on 12/14/22.
//

import Foundation
import CoreData
import UIKit

class BaseRepository<T : NSManagedObject> {
    
    var entityName: String
    let context: NSManagedObjectContext
    
    init(entityName: String) {
        self.entityName = entityName
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.context = appDelegate.persistentContainer.viewContext
    }
    
    /**
     Creates an entity object with the `entityName` and `context` pre-filled.
     */
    func create() -> T {
        let entityDesc = NSEntityDescription.entity(forEntityName: entityName, in: context)!
        return T(entity: entityDesc, insertInto: context)
    }
    
    /**
     Saves the entity to the database.
     */
    func save(entity: T) throws {
        try entity.managedObjectContext!.save()
    }
    
    /**
     Fetches all entities from the database.
     */
    func getAll() throws -> [T] {
        let req = T.fetchRequest()
        return try context.fetch(req) as! [T]
    }
    
}
