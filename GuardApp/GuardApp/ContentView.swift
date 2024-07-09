//
//  ContentView.swift
//  GuardApp
//
//  Created by 어재선 on 7/9/24.
//

import SwiftUI

struct ContentView: View {
    @State var showImage: UIImage = UIImage(systemName: "photo")!
    var body: some View {
        VStack {
            Image(uiImage: showImage)
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 400)
            Button {
                getImage()
                
            } label: {
                Text("Add picture")
            }
        }
        .padding()
    }
    
    func getImage() {
        showImage = UIImage(named: "car")!
    }
}

#Preview {
    ContentView()
}
