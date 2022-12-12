//
//  RootView.swift
//  ReSwift-Router-Example
//
//  Created by james_kong on 12/12/2022.
//

import SwiftUI
import ReSwift
import ReSwiftRouter

struct RootView: View {
    var body: some View {
        VStack {
            Button("Go To Screen 1") {
                let uuid = UUID()
                let screenNamee = "Screen 1"
                let route = ["Root", screenNamee]
                mainStore.dispatch(SetRouteSpecificData(route: route, data: "Some Para to Screen1 \(uuid)"))
                
                mainStore.dispatch(SetRouteAction(route))
            }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
