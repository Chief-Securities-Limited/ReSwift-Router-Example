//
//  AppReducer.swift
//  ReSwift-Router-Example
//
//  Created by james_kong on 12/12/2022.
//

import Foundation
import ReSwift
import ReSwiftRouter

func AppReducer(action: Action, state: AppState?) -> AppState {
    switch action {
    case _ as InitAction:
        var navigationState = NavigationState()
        navigationState.route = ["Root"]
        return AppState(
            navigationState: navigationState
        )
    default:
        return AppState(
            navigationState: NavigationStateReducer(action, state?.navigationState)
        )
    }

}

func NavigationStateReducer(_ action: Action, _ state: NavigationState?) -> NavigationState {
    var newState = state ?? NavigationState()
    switch action {
    case _ as SetRouteSpecificData, _ as SetRouteAction:
        print("NavigationStateReducer \(action)")
        
        if let routeSpecificData = action as? SetRouteAction {
            /// filter routeSpecificData or do clean up
            print("NavigationStateReducer routeSpecificData \(routeSpecificData)")
            /// clen up by condition
            /// pop from root , screen 1 to root
            if newState.route == ["Root", "Screen 1"] {
                newState.routeSpecificState = [:]
            }
            
        }
        newState = NavigationReducer.handleAction(action, state: newState)
        return newState
    default:
        return newState
    }
}
