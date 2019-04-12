//
//  AppState.swift
//  MyCounterExample
//
//  Created by dean.chung on 2019/4/12.
//  Copyright © 2019 dean.chung. All rights reserved.
//

import ReSwift

struct AppState: StateType {
  var routingState: RoutingState
  var countingState: CountingState
}
