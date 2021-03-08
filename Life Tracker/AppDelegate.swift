//
//  AppDelegate.swift
//  Life Tracker
//
//  Created by Nelson Lim on 9/25/20.
//  Copyright © 2020 Nelson Lim. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        //here
      // Correct
        /*
        
        let tabControl = MainTabController() as UITabBarController
        let naviControl = tabControl.viewControllers?[2] as! UINavigationController
        let currentControl = naviControl.viewControllers.first as! SecondViewController
        //let _ = currentControl.view
        currentControl.Message_ = mess
        currentControl.Author_ = auth
        //currentControl
*/

    /*
            let Navcontoller = tabBarController?.viewControllers?[2] as! UINavigationController//3 of these
            let CurrentController = Navcontoller.viewControllers.first as! SecondViewController   // can also use squarebrackets
            let _ = CurrentController.view // trick to force load view
            CurrentController.Message_ = self.Message
            CurrentController.Author_ = self.Author
            */
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

