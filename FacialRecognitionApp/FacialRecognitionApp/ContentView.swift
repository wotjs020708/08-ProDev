//
//  ContentView.swift
//  FacialRecognitionApp
//
//  Created by 어재선 on 7/9/24.
//

import SwiftUI
import Vision


struct ContentView: View {
    let photoArray = ["Image1", "Image2", "Image3"]
    
    @State var message = ""
    @State var arrayIndex = 0
    
    @State var newImage: UIImage = UIImage(systemName: "smiley.fill")!
    
    var body: some View {
        VStack {
            Image(photoArray[arrayIndex])
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 250,height: 250)
            Text(message)
                .padding()
            Button {
                analyzeImage(image: UIImage(named: photoArray[arrayIndex])!)
            } label: {
                Text("Analyze Image")
            }
            .padding()
            
            HStack {
                Button {
                    if arrayIndex == 0 {
                        arrayIndex = photoArray.count - 1
                    } else {
                        arrayIndex -= 1
                    }
                    message = ""
                } label: {
                    Image(systemName: "chevron.left.square.fill")
                }
                Button {
                    if arrayIndex == photoArray.count - 1 {
                        arrayIndex = 0
                    } else {
                        arrayIndex += 1
                    }
                    message = ""
                } label: {
                    Image(systemName: "chevron.right.square.fill")
                }
            }
        }
        .padding()
    }
    
    func analyzeImage(image: UIImage) {
        let handler = VNImageRequestHandler(cgImage: image.cgImage!, options: [:])
        let request = VNDetectFaceLandmarksRequest(completionHandler: handleFaceRecognition)
        try! handler.perform([request])
        
    }
    
    func handleFaceRecognition(request: VNRequest, error: Error?) {
        guard let foundFaces = request.results as? [VNFaceObservation] else {
            fatalError("Can't find a face in the picture")
            
        }
        
        message = "Found \(foundFaces.count) faces in the piucture"
        for faceRectangle in foundFaces {
                  let landmarkRegions: [VNFaceLandmarkRegion2D] = []
                  drawImage(source: newImage, boundary: faceRectangle.boundingBox, faceLandmarkRegions: landmarkRegions)
              }
    }
    
    func drawImage(source: UIImage, boundary: CGRect, faceLandmarkRegions: [VNFaceLandmarkRegion2D]) {
        UIGraphicsBeginImageContextWithOptions(source.size, false, 1)
        let context = UIGraphicsGetCurrentContext()!
        context.translateBy(x: 0, y: source.size.height)
        context.scaleBy(x: 1.0, y: -1.0)
        context.setLineJoin(.round)
        context.setLineCap(.round)
        context.setShouldAntialias(true)
        context.setAllowsAntialiasing(true)
        let rect = CGRect(x: 0, y: 0, width: source.size.width, height: source.size.height)
        context.draw(source.cgImage!, in: rect)
        // 얼굴 주위에 직사각형을 그립니다.
        let fillColor = UIColor.red
        fillColor.setStroke()
        let rectangleWidth = source.size.width * boundary.size.width
        let rectangleHeight = source.size.height * boundary.size.height
        context.setLineWidth(8)
        context.addRect(CGRect(x: boundary.origin.x * source.size.width, y: boundary.origin.y * source.size.height, width: rectangleWidth, height: rectangleHeight))
        context.drawPath(using: .stroke)
        let modifiedImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        newImage = modifiedImage
    }
}

#Preview {
    ContentView()
}
