//
//  CoreDataStack.swift
//  MyMovies
//
//  Created by David Doswell on 1/25/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {
    static let shared = CoreDataStack()
    
    let mainContext: NSManagedObjectContext
    
    init() {
        let container = NSPersistentContainer(name: "Movie")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Couldn't load data store: \(error)")
            }
        }
        
        mainContext = container.viewContext
        mainContext.automaticallyMergesChangesFromParent = true
    }
    
    func makeNewFetchedResultsController() -> NSFetchedResultsController<Movie> {
        let fetchRequest: NSFetchRequest<Movie> = Movie.fetchRequest()
        fetchRequest.sortDescriptors = [
            NSSortDescriptor(key: "timestamp", ascending: true)
        ]
        
        let frc = NSFetchedResultsController(fetchRequest: fetchRequest,
                                             managedObjectContext: mainContext,
                                             sectionNameKeyPath: nil,
                                             cacheName: nil)
        return frc
    }
    
    func save(context: NSManagedObjectContext) throws {
        var saveError: Error?
        context.performAndWait {
            do {
                try context.save()
            } catch {
                saveError = error
            }
        }
        if let error = saveError { throw error }
    }
    
}
