//
//  AudioPlayerView.swift
//  SimpleMediaApp
//
//  Created by 어재선 on 7/5/24.
//

import SwiftUI

struct AudioPlayerView: View {
    let media: MediaItem
    var audioPlayerManger = AudioPlayerManager()
    @State private var isPlay:Bool = false
    @State private var isPause: Bool = false
    @State private var playStatusText: String = "버튼을 눌러 재생하세요!"
    var body: some View {
        
        VStack {
            Text(playStatusText)
            HStack{
                // play button
                Button {
                    if !isPlay{
                        audioPlayerManger.play()
                        playStatusText = "재생 중~"
                    } else {
                        audioPlayerManger.pause()
                        playStatusText = "멈춤~"
                        isPause = true
                    }
                    isPlay.toggle()
                } label: {
                    if !isPlay {
                        Image(systemName: "play.fill")
                    } else {
                        Image(systemName: "pause.fill")
                    }
                }
                .padding()
                // stop button
                Button {
                    audioPlayerManger.stop()
                    playStatusText = "초기화!"
                    
                    isPause = false
                    isPlay = false
                    
                    
                    
                } label: {
                    if isPlay || isPause{
                        Image(systemName: "stop.fill")
                    } else {
                        Image(systemName: "stop")
                    }
                    
                    
                }
                .padding()
                
            }
            .onAppear{
                audioPlayerManger.loadAudio(name: media.fileName, withExtension: media.ext.rawValue)
            }
        }
    }
}

#Preview {
    AudioPlayerView(media: MediaItem(fileName: "sample", ext: .mp3))
}
