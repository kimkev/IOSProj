//
//  AppDelegate.swift
//  AR_Racing_Revolution
//
//  Created by Xcode User on 2019-03-16.
//  Copyright © 2019 Xcode User. All rights reserved.
//

import UIKit
import SQLite3
import AVFoundation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    // User Data stored here
    var user : UserData?
    
    // Database name
    var databaseName : String? = "Project.db"
    // Database Path to directory
    var databasePath : String?
    // Array for keeping track of the data from the database
    var people : [UserData] = []
    
    
    // When the application launches, will make connection to the database to pull the necessary data
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // setup database path
        let documentPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentsDir = documentPaths[0]
        databasePath = documentsDir.appending("/" + databaseName!)
        
        print("Databaes path is: " + databasePath!)
        checkAndCreateDatabase()
        readDataFromDatabase()
        
        MusicHelper.sharedHelper.playBackgroundMusic()
        
        return true
    }
    
    // check database at path
    func checkAndCreateDatabase(){
        let fileManager = FileManager.default
        let success = fileManager.fileExists(atPath: databasePath!)
        
        if(success){
            print("database exists")
            return
        }
        let databasePathFromApp = Bundle.main.resourcePath?.appending("/" + databaseName!)
        try? fileManager.copyItem(atPath: databasePathFromApp!, toPath: databasePath!)
    }
    
    
    // method for setting up data with stored data in database
    func readDataFromDatabase(){
        people.removeAll()
        var db : OpaquePointer? = nil
        
        if (sqlite3_open(self.databasePath, &db) == SQLITE_OK){
            print("Successfully opened connection to DB at: \(self.databasePath)")
            
            var queryStatement : OpaquePointer?
            let queryStatementString : String = "select * from user"
            
            
            if (sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK){
                while(sqlite3_step(queryStatement) == SQLITE_ROW){
                    let id : Int = Int(sqlite3_column_int(queryStatement, 0))
                    let cname = sqlite3_column_text(queryStatement, 1)
                    let cemail = sqlite3_column_text(queryStatement, 2)
                    let highscore : Int = Int(sqlite3_column_int(queryStatement, 3))
                    let volume : Int = Int(sqlite3_column_int(queryStatement, 4))
                    let sounds : Int = Int(sqlite3_column_int(queryStatement, 5))
                    let music : Int = Int(sqlite3_column_int(queryStatement, 6))
                    let hints : Int = Int(sqlite3_column_int(queryStatement, 7))
                    let notifications : Int = Int(sqlite3_column_int(queryStatement, 8))
                    let facebook : Int = Int(sqlite3_column_int(queryStatement, 9))
                    let ccolor = sqlite3_column_text(queryStatement, 10)
                    let ctire = sqlite3_column_text(queryStatement, 11)
                    
                    let name = String(cString: cname!)
                    let email = String(cString: cemail!)
                    let color = String(cString: ccolor!)
                    let tire = String(cString: ctire!)

                    
                    let data : UserData = .init()
                    data.initWithData(theID: id, theName: name, theEmail: email, theHighscore: highscore, theVolume: volume, theSounds: sounds, theMusic: music, theHints: hints, theNotifications: notifications, theFacebook: facebook, theColor: color, theTire: tire)

                    people.append(data)
                    
                    // for debugging
                    print("Query Result:")
                    print("\(id) | \(name) | \(email) |  \(highscore) | \(volume) | \(sounds) | \(music) | \(hints) | \(notifications) | \(facebook) | \(color) | \(tire)")
                }
                sqlite3_finalize(queryStatement)
            }else{
                let errmsg = String(cString: sqlite3_errmsg(db)!)
                print("error preparing select: \(errmsg)")
            }
            sqlite3_close(db)
        }else {
            print("unable to open db")
        }
    }
    
    func getPersonById(id : Int) -> UserData{
        var db : OpaquePointer? = nil
        let selectedUser : UserData = .init()
        
        if (sqlite3_open(self.databasePath, &db) == SQLITE_OK){
            print("Successfully opened connection to DB at: \(self.databasePath)")
            
            var queryStatement : OpaquePointer?
            let selectStatementString : String = "select * from user where id = ?"
            if (sqlite3_prepare(db, selectStatementString, -1, &queryStatement, nil) == SQLITE_OK){
                
                sqlite3_bind_int(queryStatement, 1, Int32(id))
                
                while(sqlite3_step(queryStatement) == SQLITE_ROW){
                    let id : Int = Int(sqlite3_column_int(queryStatement, 0))
                    let cname = sqlite3_column_text(queryStatement, 1)
                    let cemail = sqlite3_column_text(queryStatement, 2)
                    let highscore : Int = Int(sqlite3_column_int(queryStatement, 3))
                    let volume : Int = Int(sqlite3_column_int(queryStatement, 4))
                    let sounds : Int = Int(sqlite3_column_int(queryStatement, 5))
                    let music : Int = Int(sqlite3_column_int(queryStatement, 6))
                    let hints : Int = Int(sqlite3_column_int(queryStatement, 7))
                    let notifications : Int = Int(sqlite3_column_int(queryStatement, 8))
                    let facebook : Int = Int(sqlite3_column_int(queryStatement, 9))
                    let ccolor = sqlite3_column_text(queryStatement, 10)
                    let ctire = sqlite3_column_text(queryStatement, 11)
                    
                    let name = String(cString: cname!)
                    let email = String(cString: cemail!)
                    let color = String(cString: ccolor!)
                    let tire = String(cString: ctire!)
                    
                    // fill up the selected user
                    selectedUser.initWithData(theID: id, theName: name, theEmail: email, theHighscore: highscore, theVolume: volume, theSounds: sounds, theMusic: music, theHints: hints, theNotifications: notifications, theFacebook: facebook, theColor: color, theTire: tire)
                    
                    
                    // for debugging
                    print("Query Result:")
                    print("\(id) | \(name) | \(email) |  \(highscore) | \(volume) | \(sounds) | \(music) | \(hints) | \(notifications) | \(facebook) | \(color) | \(tire)")

                }
                sqlite3_finalize(queryStatement)
            }else{
                let errmsg = String(cString: sqlite3_errmsg(db)!)
                print("error preparing select: \(errmsg)")
            }
            sqlite3_close(db)
        }else {
            print("unable to open db")
        }
        
        return selectedUser
    }
    
    // method handling the insert into the database
    func insertIntoDatabase(user : UserData) -> Bool{
        var db : OpaquePointer? = nil
        var returnCode : Bool = true
        
        if (sqlite3_open(self.databasePath, &db) == SQLITE_OK){
            
            print("Successfully opened DB at \(self.databasePath)")
            
            var insertStatement : OpaquePointer? = nil
            let insertStatementString : String = "insert into user values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"
            
            if (sqlite3_prepare(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK){
                
                let nameStr = user.name as NSString
                let emailStr = user.email as NSString
                let highscoreInt = user.highscore as Int
                let volumeInt = user.volume as Int
                let soundsInt = user.sounds as Int
                let musicInt = user.music as Int
                let hintsInt = user.hints as Int
                let notificationsInt = user.notifications as Int
                let facebookInt = user.facebook as Int
                let colorStr = user.color as NSString
                let tireStr = user.tire as NSString
                

                
                sqlite3_bind_text(insertStatement, 1, nameStr.utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 2, emailStr.utf8String, -1, nil)
                sqlite3_bind_int(insertStatement, 3, Int32(highscoreInt))
                sqlite3_bind_int(insertStatement, 4, Int32(volumeInt))
                sqlite3_bind_int(insertStatement, 5, Int32(soundsInt))
                sqlite3_bind_int(insertStatement, 6, Int32(musicInt))
                sqlite3_bind_int(insertStatement, 7, Int32(hintsInt))
                sqlite3_bind_int(insertStatement, 8, Int32(notificationsInt))
                sqlite3_bind_int(insertStatement, 9, Int32(facebookInt))
                sqlite3_bind_text(insertStatement, 10, colorStr.utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 11, tireStr.utf8String, -1, nil)
                
                
                if (sqlite3_step(insertStatement) == SQLITE_DONE){
                    let rowId = sqlite3_last_insert_rowid(db)
                    print("Successfully inserted row at \(rowId)")
                }
                else{
                    let errmsg = String(cString: sqlite3_errmsg(db)!)
                    print("error preparing insert: \(errmsg)")
                    returnCode = false
                }
                sqlite3_finalize(insertStatement)
            }
            else{
                let errmsg = String(cString: sqlite3_errmsg(db)!)
                print("error preparing insert: \(errmsg)")
                returnCode = false
            }
            
            sqlite3_close(db)
        }else{
            print("Unable to open database")
            returnCode = false
        }
        
        
        return returnCode
    }
    

    // other miscellaneous methods for AppDelegate
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    // other miscellaneous methods for AppDelegate
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    // other miscellaneous methods for AppDelegate
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    // other miscellaneous methods for AppDelegate
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    // other miscellaneous methods for AppDelegate
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

