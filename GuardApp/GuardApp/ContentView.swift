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
                getImage("xyz")
                
            } label: {
                Text("Add picture")
            }
        }
        .padding()
    }
    
    func getImage(_ imageName: String) {
        //정통적인 방법
        if UIImage(named: imageName) != nil {
            showImage = UIImage(named: imageName)!
        } else {
            showImage = UIImage(systemName: "xmark.octagon.fill")!
        }
    }
}

#Preview {
    ContentView()
}
