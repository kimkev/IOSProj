//
//  ViewController.swift
//  AR_Racing_Revolution
//
//  Created by Xcode User on 2019-03-16.
//  Copyright © 2019 Xcode User. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player : AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setMainWallpaper()
        
        
        
        
        
//        let backgroundMusic = Bundle.main.path(forResource: "ParadiseWarfare", ofType: "mp3")
//        let url = URL(fileURLWithPath: backgroundMusic!)
//        soundPlayer = try! AVAudioPlayer.init(contentsOf: url)
//        soundPlayer?.currentTime = 0
//        soundPlayer?.numberOfLoops = -1
//        soundPlayer?.play()
    }

    @IBAction func unwindToHomeVC(sender: UIStoryboardSegue){
    
    }
    

}

