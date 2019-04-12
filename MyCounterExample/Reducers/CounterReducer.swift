//
//  CounterReducer.swift
//  MyCounterExample
//
//  Created by dean.chung on 2019/4/12.
//  Copyright © 2019 dean.chung. All rights reserved.
//

import ReSwift

func countingReducer(action: Action, state: CountingState?) -> CountingState {
  var state = state ?? CountingState()
  
  if let counterAction = action as? CounterAction {
    switch counterAction {
    case .increase:
      state.counter += 1
    case .decrease:
      state.counter -= 1
    }
  }
  
  return state
}
