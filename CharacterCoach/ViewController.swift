//
//  ViewController.swift
//  SingleWebView
//
//  Created by Matt Blessed on 11/5/16.
//  Copyright © 2016 Matt Blessed. All rights reserved.
//

import UIKit
import Turbolinks

class ViewController: VisitableViewController {

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Character Coach"
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.isOpaque = true
        self.navigationController?.navigationBar.barTintColor = UIColor(colorLiteralRed: 64.0/255.0, green: 84.0/255.0, blue: 178.0/255.0, alpha: 1.0)
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
//        self.navigationController?.navigationBar.barTintColor = UIColor(colorLiteralRed: 64.0/255.0, green: 84.0/255.0, blue: 178.0/255.0, alpha: 1.0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
