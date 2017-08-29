//
//  AppDelegate.swift
//  SpriteKitBackgroundMusic
//
//  Created by George Lim on 2017-08-29.
//  Copyright © 2017 George Lim. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = GameViewController()
    window?.makeKeyAndVisible()
    return true
  }
}
