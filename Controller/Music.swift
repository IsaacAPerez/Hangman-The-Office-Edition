//
//  Music.swift
//  Hangman
//
//  Created by Isaac Abel Perez on 3/5/20.
//  Copyright © 2020 Tim's Apples. All rights reserved.
//

import Foundation
import AVFoundation

// This Class creates a MusicPlayer that plays "The Office" Theme Song
class MusicPlayer {
    static let shared = MusicPlayer()
    var audioPlayer: AVAudioPlayer?

    func startBackgroundMusic() {
        if let bundle = Bundle.main.path(forResource: "TheOffice", ofType: "mp3") {
            let backgroundMusic = NSURL(fileURLWithPath: bundle)
            do {
                audioPlayer = try AVAudioPlayer(contentsOf:backgroundMusic as URL)
                guard let audioPlayer = audioPlayer else { return }
                audioPlayer.numberOfLoops = -1
                audioPlayer.prepareToPlay()
                audioPlayer.play()
            } catch {
                print(error)
            }
        }
    }
}
