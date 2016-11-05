//
//  AppDelegate.swift
//  SingleWebView
//
//  Created by Matt Blessed on 11/5/16.
//  Copyright © 2016 Matt Blessed. All rights reserved.
//

import UIKit
import Turbolinks

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let navigationController = UINavigationController()
    
    var session = Session()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // hide navigation bar
        navigationController.setNavigationBarHidden(true, animated: false)
        
        // set the window and the nav controller as root
        window = UIWindow()
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        // visit the initial website
        startApplication()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func startApplication() {
        session.delegate = self
//        visit(URL(string: "http://localhost:3000")!)
        visit(URL(string: "http://progressions-coach.herokuapp.com/")!)
    }
    
    func visit(_ url: URL) {
        let visitableViewController = ViewController(url: url)
        navigationController.pushViewController(visitableViewController, animated: true)
        session.visit(visitableViewController)
    }

}

extension AppDelegate: SessionDelegate {
    func session(_ session: Session, didProposeVisitToURL url: URL, withAction action: Action) {
        visit(url)
    }
    
    func session(_ session: Session, didFailRequestForVisitable visitable: Visitable, withError error: NSError) {
        let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        navigationController.present(alert, animated: true, completion: nil)
    }
}
