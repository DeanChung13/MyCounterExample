//
//  RoutingState.swift
//  MyCounterExample
//
//  Created by dean.chung on 2019/4/12.
//  Copyright © 2019 dean.chung. All rights reserved.
//

import ReSwift

struct RoutingState: StateType {
  var navigationState: RoutingDestination
  init(navigationState: RoutingDestination = .first) {
    self.navigationState = navigationState
  }
}
