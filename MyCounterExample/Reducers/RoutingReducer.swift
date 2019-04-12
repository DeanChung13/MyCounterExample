//
//  RoutingReducer.swift
//  MyCounterExample
//
//  Created by dean.chung on 2019/4/12.
//  Copyright © 2019 dean.chung. All rights reserved.
//

import ReSwift

func routingReducer(action: Action, state: RoutingState?) -> RoutingState {
  var state = state ?? RoutingState()
  switch action {
  case let routingAction as RoutingAction:
    state.navigationState = routingAction.destination
  default: break
  }
  return state
}
