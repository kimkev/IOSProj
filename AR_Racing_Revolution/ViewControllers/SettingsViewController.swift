//
//  SettingsViewController.swift
//  AR_Racing_Revolution
//
//  Created by Xcode User on 2019-03-16.
//  Copyright © 2019 Xcode User. All rights reserved.
//
// By: Kevin Kim

import UIKit

class SettingsViewController: ViewController {

    @IBOutlet var volume : UISlider!
    @IBOutlet var sound : UISwitch!
    @IBOutlet var music : UISwitch!
    @IBOutlet var hints : UISwitch!
    @IBOutlet var notifications : UISwitch!
    @IBOutlet var facebook : UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setSecondaryWallpaper()

        // Do any additional setup after loading the view.
    }
    
    // method for volume control of the app
    @IBAction func volumeDidChange(sender :UISlider){
        MusicHelper.sharedHelper.audioPlayer?.volume = volume.value
    }
    
    // method for turning sound on/off
    @IBAction func musicSwitched(sender :UISwitch){
        if (sound.isOn){
            MusicHelper.sharedHelper.audioPlayer?.volume = volume.value
        }
        else{
            MusicHelper.sharedHelper.audioPlayer?.volume = 0
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
