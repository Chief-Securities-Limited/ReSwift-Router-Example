//
//  AppRoutable.swift
//  ReSwift-Router-Example
//
//  Created by james_kong on 12/12/2022.
//

import Foundation
import ReSwiftRouter
import UIKit
class AppRoutable: Routable {
    weak var viewController: UIViewController?
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    public func push(_ element: RouteElement, animated: Bool, completion: @escaping RoutingCompletion) -> Routable {
        print("push element \(element)")
        print("state \(element), mainStore \(mainStore.state.navigationState)")
        var routable:Routable = self
        switch element {
        case let element where element.hasPrefix("Screen 1"):
            
            let vc = Screen1ViewConroller()
            
            self.viewController?.present(vc, animated: true)
            routable = vc
            completion()
        default:
            routable = self
            completion()
        }
        return routable
    }

    public func pop(_ element: RouteElement, animated: Bool, completion: @escaping RoutingCompletion) {
        print("pop element \(element)")
        viewController?.dismiss(animated: true)
    }

    public func change(_ from: RouteElement, to: RouteElement, animated: Bool, completion: @escaping RoutingCompletion) -> Routable {
        print("pop from \(from) to \(to)")
        var routable = self
        self.viewController?.navigationController?.popViewController(animated: true)
        switch (from, to) {
        case ("Screen1", "Screen2"):
            self.viewController?.navigationController?.pushViewController(Screen1ViewConroller(), animated: true)
            completion()
        default:
            routable = self
            completion()
        }
        return routable
    }
}
