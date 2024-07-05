//
//  ContentView.swift
//  AudioApp
//
//  Created by 어재선 on 7/5/24.
//

import SwiftUI

struct ContentView: View {
    var audioPlayerManager = AudioPlayerManager()
    @State var playAudio = false
    
    
    var body: some View {
        VStack {
            Button {
                if !playAudio {
                    audioPlayerManager.play()
                } else {
                    audioPlayerManager.pause()
                }
                playAudio.toggle()
            } label: {
                Text(!playAudio ? "Play audio" : "Pause audio")
            }
        }
        .padding()
        .onAppear {
            audioPlayerManager.loadAudio(name: "Small World", withExtension: "mp3")
            
        }
    }
}

#Preview {
    ContentView()
}
