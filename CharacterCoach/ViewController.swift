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
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set the navigation bar color to the colors of the
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.isOpaque = true
        self.navigationController?.navigationBar.barTintColor = GlobalNavigationBar.shared.tintColor
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        // setup TurboLinks configuration
        
        // disable pull to refresh
        self.visitableView.allowsPullToRefresh = false
        
        // disable zoom
        self.visitableView.webView?.scrollView.pinchGestureRecognizer?.isEnabled = false
    }

    override func visitableDidRender() {
        super.visitableDidRender()
        
        self.visitableView.webView?.evaluateJavaScript("getNavigationBarColor()", completionHandler: { (result: Any?, error: Error?) in
            
            // parse the result into an array of Floats
            if let colorString = result as? String {
                let values: [Float?] = colorString.components(separatedBy: ",").map { e in return Float(e) }
                if values.count == 3, let r: Float = values[0], let g: Float = values[1], let b: Float = values[2] {
                    // set the global navigation bar color, and update the current barTintColor
                    GlobalNavigationBar.shared.tintColor = UIColor(colorLiteralRed: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1.0)
                    
                    self.navigationController?.navigationBar.barTintColor = GlobalNavigationBar.shared.tintColor
                    
                    return
                }
            }
            
            // default red color, if error
            self.navigationController?.navigationBar.barTintColor = GlobalNavigationBar.shared.tintColor
            NSLog("Setting navigationbar color error: \(error?.localizedDescription)")
        })
    }
}
