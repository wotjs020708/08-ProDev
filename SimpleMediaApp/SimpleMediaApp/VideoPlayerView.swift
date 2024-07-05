//
//  VidioPlayerView.swift
//  SimpleMediaApp
//
//  Created by 어재선 on 7/5/24.
//

import SwiftUI
import AVKit


struct VideoPlayerView: View {
    let media: MediaItem
    @State var player: AVPlayer?
    var body: some View {
        VideoPlayer(player: player)
            .onAppear {
                guard let videoURL = Bundle.main.url(forResource: media.fileName, withExtension: media.ext.rawValue) else {
                    print("Video file not found")
                    return
                }
                player = AVPlayer(url: videoURL as URL)
            }
    }
}

#Preview {
    VideoPlayerView(media: MediaItem(fileName: "SaturnV", ext: .mov))
}
