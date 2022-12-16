//
//  Repositories.swift
//  Teddit
//
//  Created by prk on 12/14/22.
//

import Foundation
import CoreData
import UIKit

class BaseRepository<T : NSManagedObject> {
    
    var entityName: String
    private let ctx: NSManagedObjectContext
    
    init(entityName: String) {
        self.entityName = entityName
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.ctx = appDelegate.persistentContainer.viewContext
    }
    
    func create() -> T {
        let entityDesc = NSEntityDescription.entity(forEntityName: entityName, in: ctx)!
        return T(entity: entityDesc, insertInto: ctx)
    }
    
    func save(entity: T) throws {
        let nsEntity = NSEntityDescription.entity(forEntityName: entityName, in: ctx)!
        let nsObject = NSManagedObject(entity: nsEntity, insertInto: ctx)
        
        Mirror(reflecting: entity).children.forEach { child in nsObject.setValue(child.value, forKey: child.label!)
        }
        
        try ctx.save()
    }
    
    func getAll() throws -> [T] {
        let req = T.fetchRequest()
        return try ctx.fetch(req) as! [T]
    }
    
}
