//
//  CoreDataManger.swift
//  CoreDataApp
//
//  Created by 어재선 on 7/2/24.
//

import Foundation
import CoreData

class CoreDataManger {
    let persistentContainer: NSPersistentContainer

    init() {
        persistentContainer = NSPersistentContainer(name: "CoreDataApp")
        persistentContainer.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Core Data failed to tinitialize \(error.localizedDescription)")
            
            }
            
        }
    }
    
    
}
