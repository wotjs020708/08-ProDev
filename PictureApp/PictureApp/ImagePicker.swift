//
//  ImagePicker.swift
//  PictureApp
//
//  Created by 어재선 on 7/8/24.
//

import Foundation
import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    var sourceType = UIImagePickerController.SourceType.camera
    @Binding var chosenImage: UIImage
    @Environment(\.presentationMode) var presentationMode

    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let myImagePicker = UIImagePickerController()
        myImagePicker.sourceType = sourceType
        myImagePicker.delegate = context.coordinator
        return myImagePicker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
        uiViewController.sourceType = sourceType
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
}

class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var imagePicked: ImagePicker

    init(_ imagePicked: ImagePicker) {
        self.imagePicked = imagePicked
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imagePicked.chosenImage = image
        }
        imagePicked.presentationMode.wrappedValue.dismiss()
    }
}
