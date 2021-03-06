//
//  AllPlayersViewController.swift
//  AR_Racing_Revolution
//
//  Created by Xcode User on 2019-04-13.
//  Copyright © 2019 Xcode User. All rights reserved.
//
// By: Kevin Kim

import UIKit

class AllPlayersViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // connect to table outlet
    @IBOutlet var tableView : UITableView!
    // background image for table
    let img = UIImage(named: "WoodenBackground")!
    
    // call the main Delegate for retrieving data
    let mainDelegate = UIApplication.shared.delegate as! AppDelegate
    
    // table method for returning rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainDelegate.people.count
    }
    
    // table method for returning height for row
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    // table method for returning cell properties
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let imageView = UIImageView(image: img)
        imageView.alpha = 0.2
        
        let tableCell = tableView.dequeueReusableCell(withIdentifier: "cell") as? UniqueCell ?? UniqueCell(style: .default, reuseIdentifier:"cell")
        
        let rowNum = indexPath.row
        tableCell.nameLabel.text = mainDelegate.people[rowNum].name
        tableCell.highscoreLabel.text = mainDelegate.people[rowNum].email
        tableCell.backgroundView = UIView()
        tableCell.backgroundView!.addSubview(imageView)
        
        
        return tableCell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        mainDelegate.readDataFromDatabase()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let rowNum = indexPath.row
        
        let emailViewController = storyboard?.instantiateViewController(withIdentifier: "EmailView") as? EmailViewController
        emailViewController?.email = mainDelegate.people[rowNum].email
        
        self.present(emailViewController!, animated: true)
        
    }
    
    
    @IBAction func unwindToAllPlayersVC(sender:UIStoryboardSegue){
        
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
