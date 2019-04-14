//
//  Music.swift
//  AR_Racing_Revolution
//
//  Created by Trevor Rubie on 2019-04-14.
//  Copyright © 2019 Xcode User. All rights reserved.
//

import AVFoundation

class MusicHelper {
    static let sharedHelper = MusicHelper()
    var audioPlayer: AVAudioPlayer?
    
    func playBackgroundMusic() {
        let aSound = NSURL(fileURLWithPath: Bundle.main.path(forResource: "ParadiseWarfare", ofType: "mp3")!)
        do {
            audioPlayer = try AVAudioPlayer(contentsOf:aSound as URL)
            audioPlayer!.numberOfLoops = -1
            audioPlayer!.prepareToPlay()
            audioPlayer!.volume = 0.2
            
            try? AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
            try? AVAudioSession.sharedInstance().setActive(true)
            
            audioPlayer!.play()
        }
        catch {
            print("Cannot play the file")
        }
        
        
}
}
