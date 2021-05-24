//
//  ContentView.swift
//  tinder-swiftui
//
//  Created by ed on 22/05/2021.
//

import SwiftUI

struct ContentView: View {
    
    // Largely transient file that simply instantiates the
    // managers for our state and users. Calls the MainView
    // which presents our app TabBar and passes the mgr as
    // an env object which will be used to control tabBar
    // switching and UI views responding
    @ObservedObject var mgr: AppStateManager = AppStateManager()
    @ObservedObject var userMgr: UserManager = UserManager()
    
    var body: some View {
        MainView()
            .environmentObject(mgr)
            .environmentObject(userMgr)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
