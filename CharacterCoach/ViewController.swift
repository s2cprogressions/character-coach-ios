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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set the navigation bar color to the colors of the
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.isOpaque = true
        self.navigationController?.navigationBar.barTintColor = UIColor(colorLiteralRed: 64.0/255.0, green: 84.0/255.0, blue: 178.0/255.0, alpha: 1.0)
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func visitableDidRender() {
        super.visitableDidRender()
        
        self.visitableView.webView?.evaluateJavaScript("getNavigationBarColor()", completionHandler: { (result: Any?, error: Error?) in
            
            if let colorString = result as? String {
                let values: [Float?] = colorString.components(separatedBy: ",").map { e in return Float(e) }
                if values.count == 3, let r: Float = values[0], let g: Float = values[1], let b: Float = values[2] {
                    self.navigationController?.navigationBar.barTintColor = UIColor(colorLiteralRed: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1.0)
                    return
                }
            }
            
            // default blue color, if error
            self.navigationController?.navigationBar.barTintColor = UIColor(colorLiteralRed: 64.0/255.0, green: 84.0/255.0, blue: 178.0/255.0, alpha: 1.0)
            NSLog("Setting navigationbar color error: \(error?.localizedDescription)")
            
        })
    }
}
