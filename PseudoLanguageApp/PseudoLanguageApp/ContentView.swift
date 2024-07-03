//
//  ContentView.swift
//  PseudoLanguageApp
//
//  Created by 어재선 on 7/3/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, world")
                .padding()
                .background(Color.yellow)
            
            Text("This is a lot of text to display in a small amount of sace to test how well Xcode can truncate large amounts of text.")
                .padding()
                .background(Color.mint)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
