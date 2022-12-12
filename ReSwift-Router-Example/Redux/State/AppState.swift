//
//  AppState.swift
//  ReSwift-Router-Example
//
//  Created by james_kong on 12/12/2022.
//

import ReSwift
import ReSwiftRouter

struct AppState {
    var navigationState: NavigationState
    init(navigationState: NavigationState) {
        self.navigationState = navigationState
    }
}
