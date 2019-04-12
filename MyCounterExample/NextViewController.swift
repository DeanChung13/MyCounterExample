//
//  NextViewController.swift
//  MyCounterExample
//
//  Created by dean.chung on 2019/4/12.
//  Copyright © 2019 dean.chung. All rights reserved.
//

import UIKit
import ReSwift

class NextViewController: UIViewController {
  @IBOutlet weak var counterLabel: UILabel!
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.title = "Next"
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    store.subscribe(self) {
      $0.select {
        $0.countingState
      }
    }
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    store.unsubscribe(self)
  }
  
  
  @IBAction func nextViewController(_ sender: Any) {
//    store.dispatch(RoutingAction(destination: .next))
    AppRouter.pushViewController(routing: .first)
  }
  
  @IBAction func increaseCounter(_ sender: Any) {
    store.dispatch(CounterAction.increase)
  }
  @IBAction func decreaseCounter(_ sender: Any) {
    store.dispatch(CounterAction.decrease)
  }
}

extension NextViewController: StoreSubscriber {
  func newState(state: CountingState) {
    counterLabel.text = "\(state.counter)"
  }
}

