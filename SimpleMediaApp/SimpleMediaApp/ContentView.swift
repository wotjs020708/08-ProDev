//
//  ContentView.swift
//  SimpleMediaApp
//
//  Created by 어재선 on 7/5/24.
//

import SwiftUI



struct ContentView: View {
    let medias = [MediaItem(fileName: "Bigbang - Monster",ext: .mp4),
                  MediaItem(fileName: "sample",ext: .mp3),
                  MediaItem(fileName: "sample2",ext: .mp3),
                  MediaItem(fileName: "Samsung Premiere 2013 Opening",ext: .mov),
                  MediaItem(fileName: "SaturnV",ext: .mov)]
    

    var body: some View {
        
        NavigationStack {
            List {
                ForEach(medias) { media in
                    NavigationLink(destination: DetailsView(media: media)){
                        HStack{
                            if media.ext == .mov || media.ext == .mp4 {
                                Image(systemName: "video.fill")
                            } else {
                                Image(systemName: "music.note")
                                
                            }
                            Text(media.fileName)
                            
                        }
                    }
                    
                }
            }
            .navigationTitle("MediaPlayer")
        }
        
    }
}

#Preview {
    
    NavigationStack{
        ContentView()
    }
}
