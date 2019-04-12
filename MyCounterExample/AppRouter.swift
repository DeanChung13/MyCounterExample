//
//  AppRouter.swift
//  MyCounterExample
//
//  Created by dean.chung on 2019/4/12.
//  Copyright © 2019 dean.chung. All rights reserved.
//

import ReSwift
import UIKit

enum RoutingDestination: String {
  case first = "ViewController"
  case next = "NextViewController"
}

final class AppRouter {
  let navigationController: UINavigationController
  init(window: UIWindow) {
    navigationController = UINavigationController()
    window.rootViewController = navigationController

    store.subscribe(self) {
      $0.select {
        $0.routingState
      }
    }
  }
  
  static func pushViewController(routing: RoutingDestination) {
    if let window = UIApplication.shared.keyWindow {
    AppRouter(window: window).pushViewController(identifier: routing.rawValue, animated: true)
    }
  }
  
  fileprivate func pushViewController(identifier: String, animated: Bool) {
    let viewController = instantiateViewController(identifier: identifier)
    let newViewControllerType = type(of: viewController)
    if let currentVc = navigationController.topViewController {
      let currentViewControllerType = type(of: currentVc)
      if currentViewControllerType == newViewControllerType {
        return
      }
    }
    navigationController.pushViewController(viewController, animated: animated)
  }
  
  private func instantiateViewController(identifier: String) -> UIViewController {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    return storyboard.instantiateViewController(withIdentifier: identifier)
  }
}

extension AppRouter: StoreSubscriber {
  func newState(state: RoutingState) {
    let shouldAnimate = navigationController.topViewController != nil
    pushViewController(identifier: state.navigationState.rawValue, animated: shouldAnimate)
  }
}
