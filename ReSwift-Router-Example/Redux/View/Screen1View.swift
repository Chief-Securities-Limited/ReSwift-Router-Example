//
//  Screen1View.swift
//  ReSwift-Router-Example
//
//  Created by james_kong on 12/12/2022.
//

import SwiftUI
import ReSwiftRouter
import ReSwift

class Screen1ViewMode: ObservableObject {
    @Published var message: String = ""
}


struct Screen1View: View {
    @ObservedObject var viewModel: Screen1ViewMode // ViewModel
    
    init(message: String) {
        
        self.viewModel = Screen1ViewMode()
        
        switch mainStore.state.navigationState.route {
        case let route where route == ["Root", "Screen 1"]:
            /// "Root", "Screen 1"
            self.viewModel.message = mainStore.state.navigationState.routeSpecificState[RouteHash(route: route)] as? String ?? ""
        case let route where route == ["Root", "Screen A", "Screen 1"]:
            /// "Root", "Screen A", "Screen 1" Data
            self.viewModel.message = mainStore.state.navigationState.routeSpecificState[RouteHash(route: route)] as? String ?? ""
            break
        case let route where route == ["Screen123", "Screen A", "Screen 1"]:
            /// "Screen123", "Screen A", "Screen 1"
            self.viewModel.message = mainStore.state.navigationState.routeSpecificState[RouteHash(route: route)] as? String ?? ""
            break
        default:
            break
        }
    }
    
    var body: some View {
        VStack {
            Text(self.viewModel.message)
            Button("Back") {
                var currentRoute = mainStore.state.navigationState.route
                let _ = currentRoute.popLast()
                mainStore.dispatch(SetRouteAction(currentRoute))
            }
        }
    }
}

struct Screen1View_Previews: PreviewProvider {
    static var previews: some View {
        Screen1View(message: "")
    }
}
