//
//  Wallpaper.swift
//  AR_Racing_Revolution
//
//  Created by Xcode User on 2019-04-14.
//  Copyright © 2019 Xcode User. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func setMainWallpaper(){
        
//        let bgImage = UIImageView(image: UIImage(named: "carlane.png"))
//        self.view.addSubview(bgImage)
        
        
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "carlane.jpg")?.draw(in: self.view.bounds)
        
        if let image = UIGraphicsGetImageFromCurrentImageContext(){
            UIGraphicsEndImageContext()
            self.view.backgroundColor = UIColor(patternImage: image)
        }
    }
    
    func setSecondaryWallpaper(){
        
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "lane.png")?.draw(in: self.view.bounds)
        
        if let image = UIGraphicsGetImageFromCurrentImageContext(){
            UIGraphicsEndImageContext()
            self.view.backgroundColor = UIColor(patternImage: image)
        }
    }



}
