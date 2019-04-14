//
//  CustomizeViewController.swift
//  AR_Racing_Revolution
//
//  Created by Xcode User on 2019-03-16.
//  Copyright © 2019 Xcode User. All rights reserved.
//
// Allows for a preview of what the players car will look like in the ARView
// By: Trevor Rubie

import UIKit

class CustomizeViewController: ViewController {

    @IBOutlet var sgCar : UISegmentedControl!
    @IBOutlet var sgTire : UISegmentedControl!
    
    @IBOutlet var imCar : UIImageView!
    @IBOutlet var imTire : UIImageView!
    
        
    //Changes tire size when seg changes
    func updateTire(){
        
        let tire = sgTire.selectedSegmentIndex
        
        if tire == 0 {
            imTire.image = UIImage(named: "smalltire")
        } else if tire == 1{
            imTire.image = UIImage(named: "medtire")
        } else {
           imTire.image = UIImage(named: "bigtire")
        }
        
        
    }
    //Changes car colour when seg changes
    func updateCar(){
        
        let car = sgCar.selectedSegmentIndex
        
        if car == 0 {
            imCar.image = UIImage(named: "greencar")
        } else if car == 1 {
            imCar.image = UIImage(named: "bluecar")
        } else if car == 2 {
            imCar.image = UIImage(named: "yellowcar")
        } else {
            imCar.image = UIImage(named: "redcar")
        }
        
        
    }
    
    //Listener for segment change
    @IBAction func segDidChange(sender : UISegmentedControl){
        updateCar()
        updateTire()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setSecondaryWallpaper()

        sgTire.setBackgroundImage(UIImage(named: "menubutton"), for: .normal, barMetrics: .default)
        sgCar.setBackgroundImage(UIImage(named: "menubutton"), for: .normal, barMetrics: .default)
        
        //sgTire.setImage(UIImage(named: "menubutton")?.withRenderingMode(.alwaysOriginal), forSegmentAt: 0)
        //sgTire.setImage(UIImage(named: "menubutton")?.withRenderingMode(.alwaysOriginal), forSegmentAt: 1)
        //sgTire.setImage(UIImage(named: "menubutton")?.withRenderingMode(.alwaysOriginal), forSegmentAt: 2)
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
