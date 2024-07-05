//
//  ContentView.swift
//  VideoApp
//
//  Created by 어재선 on 7/5/24.
//

import SwiftUI
import AVKit

struct ContentView: View {
    @State var player: AVPlayer?
    var body: some View {
        
        // VideoPlayer(player: player, videoOverlay: { })
        // 아래 코드처럼 후행 클로저 사용 가능
        VideoPlayer(player: player) {
            VStack {
                Text("Overlay text to appear")
                    .foregroundStyle(.white)
            }
        }
            .frame(height: 320)
            .onAppear {
                guard let videoURL = Bundle.main.url(forResource: "SaturnV", withExtension: "mov") else {
                    print("Video file not found")
                    return
                }
                player = AVPlayer(url: videoURL as URL)
            }
    }
}

#Preview {
    ContentView()
}
