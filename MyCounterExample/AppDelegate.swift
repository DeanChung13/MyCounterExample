//
//  AppDelegate.swift
//  MyCounterExample
//
//  Created by dean.chung on 2019/4/12.
//  Copyright © 2019 dean.chung. All rights reserved.
//

import UIKit
import ReSwift

let store = Store<AppState>(reducer: appReducer, state: nil)

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  var appRouter: AppRouter?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    let window = UIWindow(frame: UIScreen.main.bounds)
    self.window = window
    window.makeKeyAndVisible()
    appRouter = AppRouter(window: window)
    return true
  }
}

