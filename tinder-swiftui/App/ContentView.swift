//
//  ContentView.swift
//  tinder-swiftui
//
//  Created by ed on 22/05/2021.
//

import SwiftUI

struct ContentView: View {
    
    // Largely transient file that simply instantiates the
    // manager for our state and calls the MainView which
    // presents our app TabBar and passes the mgr as an env
    // object which will be used to control tabbar switching
    // and UI views responding
    @ObservedObject var mgr: AppStateManager = AppStateManager()
    
    var body: some View {
        MainView()
            .environmentObject(mgr)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
