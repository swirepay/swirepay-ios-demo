//
//  AppDelegate.swift
//  SWIOSDemo
//
//  Created by Dinesh on 04/03/21.
//

import UIKit
import Swirepay_IOS

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let api_key = "sk_test_xkNDG8VLfNYEqOMVvrMho98K60NGkuyQ" //
          //sk_test_7hneHju6knsZT29ZatWq5gIHNav41ls9 live
         // sk_test_xkNDG8VLfNYEqOMVvrMho98K60NGkuyQ debug
        
        SwirepaySDK.shared.initSDK(publishKey: api_key)
        return true
    }

    // MARK: UISceneSession Lifecycle

//    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
//        // Called when a new scene session is being created.
//        // Use this method to select a configuration to create the new scene with.
//        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
//    }
//
//    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
//        // Called when the user discards a scene session.
//        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//    }


}

