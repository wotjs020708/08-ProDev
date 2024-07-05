//
//  File.swift
//  SimpleMediaApp
//
//  Created by 어재선 on 7/5/24.
//

import AVFoundation

class AudioPlayerManager {
    var audiPlayer: AVAudioPlayer?
    
    func loadAudio(name fileName: String, withExtension ext: String) {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: ext) else {
            print("Audio file not foundd")
            return
        }
        
        do {
            audiPlayer = try AVAudioPlayer(contentsOf: url)
            audiPlayer?.prepareToPlay()
        } catch {
            print("Error loading audio : \(error.localizedDescription)")
        }
    }
    
    func play() {
        audiPlayer?.play()
    }
    
    func pause() {
        audiPlayer?.pause()
    }
    
    func stop() {
        audiPlayer?.stop()
        audiPlayer?.currentTime = 0
    }
    
}


