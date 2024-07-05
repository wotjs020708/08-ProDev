//
//  MediaItem.swift
//  SimpleMediaApp
//
//  Created by 어재선 on 7/5/24.
//

import Foundation

struct MediaItem: Identifiable{
    let id: UUID = UUID()
    let fileName : String
    let ext: ext
    
    enum ext: String {
        case mp3
        case mp4
        case mov
    }
    
}
