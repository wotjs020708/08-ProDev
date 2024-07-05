//
//  DetailsView.swift
//  SimpleMediaApp
//
//  Created by 어재선 on 7/5/24.
//

import SwiftUI

struct DetailsView: View {
    let media: MediaItem
    var body: some View {
        
        VStack {
        
            switch media.ext {
            case .mp3:
                AudioPlayerView(media: media)
            case .mp4, .mov:
                VideoPlayerView(media: media)
            }
        }
        .navigationTitle(media.fileName)
        
    }
}

#Preview {
    NavigationStack {
        DetailsView(media: MediaItem(fileName: "sample", ext: .mp3))
    }
}
