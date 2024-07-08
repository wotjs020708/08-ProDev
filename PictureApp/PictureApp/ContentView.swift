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
                    sourceType = .photoLibrary
                    showSheet = true
                } label: {
                    Text("Photo library")
                        .font(.title2)
                }
                
                Spacer()
                Button {
                    sourceType = .camera
                    showSheet = true
                } label: {
                    Text("Camera")
                        .font(.title2)
                }
            }
        }
        .padding()
        .sheet(isPresented: $showSheet) {
            // 첫번째 카메라 선택시 사진 라이브러리가 뜨는 문제가 있음.
            ImagePicker(sourceType: sourceType ,chosenImage: $image)
                .ignoresSafeArea()
        }
    }
    
}

#Preview {
    ContentView()
}
