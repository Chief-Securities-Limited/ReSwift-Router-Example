//
//  Screen1ViewConroller.swift
//  ReSwift-Router-Example
//
//  Created by james_kong on 12/12/2022.
//

import Foundation
import UIKit
import ReSwiftRouter
import ReSwift
import SwiftUI

class Screen1ViewConroller: UIViewController, Routable {
    
    convenience init() {
        self.init(nibName: nil, bundle: nil)
        modalPresentationStyle = .fullScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    
        let hostingViewController = UIHostingController(rootView: Screen1View(message: ""))
        addChild(hostingViewController)
        if let childView = hostingViewController.view {
            
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
