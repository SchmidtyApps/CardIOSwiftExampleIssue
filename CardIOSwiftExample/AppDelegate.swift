//
//  AppDelegate.swift
//  CardIOSwiftExample
//
//  Created by Michael Schmidt on 10/18/17.
//  Copyright © 2017 Example. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UIGestureRecognizerDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        setupTapGesture()
        return true
    }
    
    func setupTapGesture() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.tappedNavAppearance))
        window?.addGestureRecognizer(tapGestureRecognizer)
    }
    
    func tappedNavAppearance() {
        print("tapped")
    }
}

