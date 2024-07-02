//
//  ContentView.swift
//  PetApp
//
//  Created by 어재선 on 7/2/24.
//

import SwiftUI

struct ContentView: View {
    let coreDM: CoreDataManager
    
    @State var petName = ""
    @State var petBreed = ""
    @State var petArray = [Animal]()
    var body: some View {
        VStack {
            TextField("Enter pet name", text: $petName)
            TextField("Enter pet breed", text: $petBreed)
            Button("Save") {
                coreDM.savePet(name: petName, breed: petBreed)
                
                displayPets()
                petName = ""
                petBreed = ""
            }
            List {
                ForEach(petArray, id:\.self) { pet in
                    VStack {
                        Text(pet.name ?? "")
                        Text(pet.breed ?? "")
                    }
                }
            }
        }
        .padding()
        .onAppear() {
            displayPets()
        }
    }
    
    func displayPets() {
        petArray = coreDM.getAllPets()
    }
}

#Preview {
    ContentView(coreDM: CoreDataManager())
}
