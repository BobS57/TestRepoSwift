//
//  AppDelegate.swift
//  TestStevia
//
//  Created by Robert Seitsinger on 4/12/17.
//  Copyright © 2017 cs378. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // Create the one-and-only app window. This is usually done by iOS as part
        // of the UI startup process when a storyboard is used.
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        // Instantiate the initial view controller and set it as the root view
        // controller for the one-and-only app window.
        self.window?.rootViewController = FirstViewController()
        
        // Make the one-and-only window the 'key' window and show it.
        // By virtue of showing the window, we're also showing the root view controller.
        //
        // The concept of 'key' window here is a bit silly - primarily because it's
        // unusual for there to be more than one window in a typical iOS app.
        self.window?.makeKeyAndVisible()

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
}

