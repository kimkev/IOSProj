//
//  AboutUsViewController.swift
//  AR_Racing_Revolution
//
//  Created by Trevor Rubie on 2019-04-14.
//  Copyright © 2019 Xcode User. All rights reserved.
//
// By: Trevor Rubie

import UIKit
import WebKit

class AboutUsViewController: UIViewController, WKNavigationDelegate {
    
    @IBOutlet var wbPage : WKWebView!
    @IBOutlet var activity : UIActivityIndicatorView!
    
    func webView(_ webView:WKWebView, didStartProvisionalNavigation navigation: WKNavigation!){
        activity.isHidden = false
        activity.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activity.isHidden = true
        activity.stopAnimating()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlAddress = URL(string: "https://www.google.ca")
        let url = URLRequest(url: urlAddress!)
        wbPage.load(url)
        wbPage.navigationDelegate = self
}

}
