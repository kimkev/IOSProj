//
//  EmailViewController.swift
//  AR_Racing_Revolution
//
//  Created by Xcode User on 2019-04-14.
//  Copyright © 2019 Xcode User. All rights reserved.
//
// By: Kevin Kim

import UIKit
import Foundation
import MessageUI

class EmailViewController: UIViewController, MFMailComposeViewControllerDelegate, UITextFieldDelegate {
    
    // email label field
    @IBOutlet var tfEmail : UITextField!
    
    // email title textfield
    @IBOutlet var tfTitle : UITextField!
    // email body textview
    @IBOutlet var tvBody : UITextView!
    
    
    // email member passed from AllPlayerViewController
    var email : String!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    //     hide keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // email sending method
    @IBAction func sendEmail(sender : Any){
        //        let mailComposeVC = configureMailController()
        
        if !MFMailComposeViewController.canSendMail() {
            print("Mail services are not available")
            showMailError()
            return
        }
        
        let mailComposeVC = MFMailComposeViewController()
            mailComposeVC.mailComposeDelegate = self
            mailComposeVC.setToRecipients(["k6yk07@yopmail.com"])
            mailComposeVC.setSubject("title")
            mailComposeVC.setMessageBody("body", isHTML: false)
            self.present(mailComposeVC, animated: true, completion: nil)
    }
    
    
    //    func configureMailController() -> MFMailComposeViewController {
    //        let composeVC = MFMailComposeViewController()
    //        composeVC.mailComposeDelegate = self
    //        // Configure the fields of the interface.
    //        composeVC.setToRecipients([tfEmail.text!])
    //        composeVC.setSubject(tfTitle.text!)
    //        composeVC.setMessageBody(tvBody.text!, isHTML: false)
    //        // Present the view controller modally.
    //        self.present(composeVC, animated: true, completion: nil)
    //
    //        return composeVC
    //    }
    
    // show error as a popup if email doesn't work
    func showMailError(){
        let sendMailErrorAlert = UIAlertController(title: "could not send email", message: "Device could not send email", preferredStyle: .alert)
        let dismiss = UIAlertAction(title: "Ok", style: .default, handler: nil)
        sendMailErrorAlert.addAction(dismiss)
        self.present(sendMailErrorAlert, animated: true, completion: nil)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    
    // set the email textfield from the all players table
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tfEmail.text = email
        // Do any additional setup after loading the view.
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
