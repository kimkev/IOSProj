//
//  UserData.swift
//  AR_Racing_Revolution
//
//  Created by Xcode User on 2019-04-13.
//  Copyright © 2019 Xcode User. All rights reserved.
//
// By: Kevin Kim

import UIKit

class UserData: NSObject {

    // Credentials of the user
    // ID of a user
    var id : Int?
    // name of a user
    var name : String = ""
    // email of the user
    var email : String = ""
    // highscore of the user
    var highscore : Int = 0
    
    // Settings configuration for the user
    // volume of the application for the user
    var volume : Int = 0
    // sounds on/off default to true
    var sounds : Int = 1
    // Music on/off default to true
    var music : Int = 1
    // Hints on/off default to true
    var hints : Int = 1
    // notifications on/off default to true
    var notifications : Int = 1
    // Facebook Connected default to true
    var facebook : Int = 1
    
    // Customize Options for the user
    // Colour of the model
    var color : String = ""
    // size of the tires
    var tire : String = ""
    
    
    // initializing of a user with given name and email
    func initWithData(theID i : Int, theName name : String, theEmail email : String, theHighscore highscore : Int, theVolume volume : Int, theSounds sounds : Int, theMusic music : Int, theHints hints : Int, theNotifications notifications : Int, theFacebook facebook : Int, theColor color : String, theTire tire : String){
        self.id = i
        self.name = name
        self.email = email
        self.highscore = highscore
        self.volume = volume
        self.sounds = sounds
        self.music = music
        self.hints = hints
        self.notifications = notifications
        self.facebook = facebook
        self.color = color
        self.tire = tire
    }
}
