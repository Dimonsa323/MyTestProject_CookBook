//
//  File.swift
//  MyTestProject_CookBook
//
//  Created by Дима Губеня on 07.01.2023.
//

import Foundation
import CoreData

protocol CoreDataStoreProtocol {
    var context: NSManagedObjectContext { get }
    
}

class CoreDataStore: CoreDataStoreProtocol {
    
    // MARK: - Core Data stack
        
        lazy var context: NSManagedObjectContext = {
            persistentContainer.viewContext
        }()
        
        lazy var persistentContainer: NSPersistentContainer = {
            
            let container = NSPersistentContainer(name: "TestApplication")
            container.loadPersistentStores(completionHandler: { (storeDescription, error) in
                if let error = error as NSError? {
                    
                    fatalError("Unresolved error \(error), \(error.userInfo)")
                }
            })
            return container
        }()
    }
