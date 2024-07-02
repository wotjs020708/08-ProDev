//
//  PetAppApp.swift
//  PetApp
//
//  Created by 어재선 on 7/2/24.
//

import SwiftUI

@main
struct PetAppApp: App {
    let coreDM = CoreDataManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, coreDM.persistentContainer.viewContext)
        }
    }
}
