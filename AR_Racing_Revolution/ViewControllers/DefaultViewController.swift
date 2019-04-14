//
//  DefaultViewController.swift
//  AR_Racing_Revolution
//
//  Created by Xcode User on 2019-04-14.
//  Copyright © 2019 Xcode User. All rights reserved.
//

import UIKit

class DefaultViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "carlane.png")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
    }

}
