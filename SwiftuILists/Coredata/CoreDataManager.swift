//
//  CoreDataManager.swift
//  SwiftuILists
//
//  Created by paige on 2022/04/08.
//

import CoreData

class CoreDataManager {
    
    let persistentContainer: NSPersistentContainer
    
    init() {
        persistentContainer = NSPersistentContainer(name: "HelloCoreDataModel")
        persistentContainer.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Core Data Store failed to initialize \(error.localizedDescription)")
            }
        }
    }
    
    func updateMovie() {
        
        do {
            try persistentContainer.viewContext.save()
        } catch {
            persistentContainer.viewContext.rollback()
        }
        
    }
    
    func deleteMovie(movie: MyMovie) {
        
        persistentContainer.viewContext.delete(movie)
        
        do {
            try persistentContainer.viewContext.save()
        } catch {
            persistentContainer.viewContext.rollback()
            print("Failed to save context \(error.localizedDescription)")
        }
        
    }
    
    func getAllMovies() -> [MyMovie] {
        
        let fetchRequest: NSFetchRequest<MyMovie> = MyMovie.fetchRequest()
        
        do {
            return try persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            return []
        }
        
    }
    
    func saveMovie(title: String) {
        
        let movie = MyMovie(context: persistentContainer.viewContext)
        movie.title = title
        
        do {
            try persistentContainer.viewContext.save()
            print("Movie saved!")
        } catch {
            print("Failed to save movie \(error)")
        }
       
        
    }
    
}
