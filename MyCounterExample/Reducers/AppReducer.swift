//
//  AppReducer.swift
//  MyCounterExample
//
//  Created by dean.chung on 2019/4/12.
//  Copyright © 2019 dean.chung. All rights reserved.
//

import ReSwift

func appReducer(action: Action, state: AppState?) -> AppState {
  return AppState(
    routingState: routingReducer(action: action, state: state?.routingState),
    countingState: countingReducer(action: action, state: state?.countingState)
  )
}
