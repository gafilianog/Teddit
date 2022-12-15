//
//  Repositories.swift
//  Teddit
//
//  Created by prk on 12/14/22.
//

import Foundation
import CoreData
import UIKit

class BaseRepository<T> {
    
    var entityName: String
    private let ctx: NSManagedObjectContext
    
    init(entityName: String) {
        self.entityName = entityName
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.ctx = appDelegate.persistentContainer.viewContext
    }
    
    func save(entity: T) throws {
        let nsEntity = NSEntityDescription.entity(forEntityName: entityName, in: ctx)!
        
        let nsObject = NSManagedObject(entity: nsEntity, insertInto: ctx)
        
        Mirror(reflecting: entity).children.forEach { child in nsObject.setValue(child.value, forKey: child.label!)
        }
        
        try ctx.save()
    }
    
    func prepareRequest() -> NSFetchRequest<NSFetchRequestResult> {
        return NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        
    }
    
    func getAll() throws -> [T] {
        let req = self.prepareRequest()
        let res = try ctx.fetch(req) as! [NSManagedObject]
        
        var entities: [T] = []

        for nsObject in res {
            let entity = T.self
            let mirror = Mirror(reflecting: entity)
            
            for var child in mirror.children {
                child.value = nsObject.value(forKey: child.label!)!
            }
            
            entities.append(entity as! T)
        }
        
        return entities
    }
    
}
