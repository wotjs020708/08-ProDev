//
//  DisplaytextField.swift
//  StateObjectApp
//
//  Created by 어재선 on 7/2/24.
//

import SwiftUI

struct DisplayTextField: View {
    @ObservedObject var creature: AnimalModel
    
    var body: some View {
        VStack {
            HStack {
                Text("Name:")
                TextField("Type a name here", text: $creature.name)
            }
            HStack {
                Text("Breed:")
                TextField("Type a name here", text: $creature.breed)
            }
            HStack {
                Text("Age:")
                Slider(value: $creature.age, in: 0...20)
            }
            HStack {
                Text("Weight:")
                Slider(value: $creature.weight, in: 0...200)
            }
        }
    }
}
