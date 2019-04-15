//
//  SettingsViewController.swift
//  AR_Racing_Revolution
//
//  Created by Xcode User on 2019-03-16.
//  Copyright © 2019 Xcode User. All rights reserved.
//
// By: Kevin Kim

import UIKit
import AVFoundation

class SettingsViewController: ViewController {

    @IBOutlet var volume : UISlider!
    @IBOutlet var sound : UISwitch!
    @IBOutlet var music : UISwitch!
    @IBOutlet var hints : UISwitch!
    @IBOutlet var notifications : UISwitch!
    @IBOutlet var facebook : UIButton!
    
    //var audioPlayer: AVAudioPlayer?
    
    func btnSound (sender: Any) {
//        let clickSound = URL(fileURLWithPath: Bundle.main.path(forResource: "buttonclick", ofType: "mp3")!)
//
//        do {
//            audioPlayer = try AVAudioPlayer(contentsOf: clickSound as URL)
//            audioPlayer!.numberOfLoops = 1
//            audioPlayer!.prepareToPlay()
//            audioPlayer!.volume = 1
//
//            audioPlayer!.play()
//        } catch {
//            print("Cannot play the file")
//        }
    }
    
    @IBAction func soundSwitch(sender: UISwitch) {
        if (sound.isOn){
            MusicHelper.sharedHelper.clickPlayer?.volume = 0.7
        }
            
        else {
            MusicHelper.sharedHelper.clickPlayer?.volume = 0
        }
    }
    
    // method for volume control of the app
    @IBAction func volumeDidChange(sender :UISlider){
        MusicHelper.sharedHelper.audioPlayer?.volume = volume.value
    }
    
    // method for turning sound on/off
    @IBAction func musicSwitched(sender :UISwitch){
        if (music.isOn){
            MusicHelper.sharedHelper.audioPlayer?.volume = volume.value
        }
        else{
            MusicHelper.sharedHelper.audioPlayer?.volume = 0
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let loginButton = FBSDKLoginButton()
        
        loginButton.frame = CGRect(x: 0, y: 0, width: 200, height: 40)
        let newCenter = CGPoint(x: 190, y: 450)
        loginButton.center = newCenter
        
        self.view.addSubview(loginButton)
    }
    
}
