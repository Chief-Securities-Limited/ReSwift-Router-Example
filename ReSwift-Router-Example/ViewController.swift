//
//  ViewController.swift
//  ReSwift-Router-Example
//
//  Created by james_kong on 12/12/2022.
//

import UIKit
import ReSwift
import SwiftUI
import ReSwiftRouter

class ViewController: UIViewController {
    var routable: AppRoutable!
    var router: Router<AppState>!
    override func viewDidLoad() {
        routable = AppRoutable(viewController: self)
        router = Router(
            store: mainStore,
            rootRoutable: routable,
            stateTransform: { state in
            state.select {
                $0.navigationState
            }
        })
        
        view.backgroundColor = .white
        
        super.viewDidLoad()
        print(mainStore.state)
        // Do any additional setup after loading the view.
        let hostingViewController = UIHostingController(rootView: RootView())
        addChild(hostingViewController)
        if let childView = hostingViewController.view {
            view.translatesAutoresizingMaskIntoConstraints = false
            childView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(childView)
            NSLayoutConstraint.activate([
                childView.topAnchor.constraint(equalTo: view.topAnchor),
                childView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                childView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                childView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                
            ])
        }
    }


}


extension ViewController: StoreSubscriber {
    typealias StoreSubscriberStateType = AppState
    func newState(state: AppState) {
        
        
        switch state.navigationState.route {
        case let route where route == ["Root", "Screen 1"]:
            print(state.navigationState.routeSpecificState)
        default:
            break
        }
        
        print(state)
    }
}
