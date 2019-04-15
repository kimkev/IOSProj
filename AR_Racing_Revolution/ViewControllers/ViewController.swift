//
//  ViewController.swift
//  AR_Racing_Revolution
//
//  Created by Xcode User on 2019-03-16.
//  Copyright © 2019 Xcode User. All rights reserved.
//
// By Luke Dam

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var clickPlayer: AVAudioPlayer?
    
    @IBAction func btnclick(_ sender: Any) {
        MusicHelper.sharedHelper.playButtonSound()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.setMainWallpaper()
        

    }

    @IBAction func unwindToHomeVC(sender: UIStoryboardSegue){
    
    }
    

}

