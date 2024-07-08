//
//  ContentView.swift
//  Text2Speech
//
//  Created by 어재선 on 7/8/24.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    let audio = AVSpeechSynthesizer()
    
    @State var converText = AVSpeechUtterance(string: "")
    @State var textToRoad = "This is a test of the emergency broadcast system"
    @State var sliderValue: Float = 0.0

    var body: some View {
        VStack {
            TextEditor(text: $textToRoad)
                .frame(width: 250,height: 200)
            Slider(value: $sliderValue, in: 0...10)
            Button {
                converText = AVSpeechUtterance(string: textToRoad)
                converText.rate = sliderValue
                audio.speak(converText)
            } label: {
                Text("Read Text Out Loud")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
