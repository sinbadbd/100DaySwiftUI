//
//  MyAppDelegate.swift
//  SwiftUILifeCycle
//
//  Created by Imran on 27/5/21.
//

import Foundation
import UIKit

class MyAppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("Custom AppDelegate is here...")
        return  true
    }
    
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        
        let config = UISceneConfiguration(name: "My Scene Delegate", sessionRole: connectingSceneSession.role)
        config.delegateClass = MySceneDelegate.self
        
        return config
    }
}
