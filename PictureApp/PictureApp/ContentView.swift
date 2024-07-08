//
//  ContentView.swift
//  PictureApp
//
//  Created by 어재선 on 7/8/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showSheet = false
    @State private var image = UIImage()
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    var body: some View {
        VStack {
            Image(uiImage: self.image)
                .resizable()
                .scaledToFill()
                .frame(minWidth: 0, maxWidth: .infinity)
            
            HStack{
                Button {
                    showSheet = true
                    sourceType = .photoLibrary
                } label: {
                    Text("Photo library")
                        .font(.title2)
                }
                
                Spacer()
                Button {
                    showSheet = true
                    sourceType = .camera
                } label: {
                    Text("Camera")
                        .font(.title2)
                }
            }
        }
        .padding()
        .sheet(isPresented: $showSheet) {
            ImagePicker(sourceType: sourceType ,chosenImage: $image)
        }
    }
    
}

#Preview {
    ContentView()
}
