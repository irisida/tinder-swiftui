//
//  MainView.swift
//  tinder-swiftui
//
//  Created by ed on 22/05/2021.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var appState: AppStateManager
    
    func presentViewForState() -> some View {
        switch appState.selectedTab {
        
        case .fire:
            let view = Text("Fire")
            return AnyView(view)
            
        case .star:
            let view = Text("Star")
            return AnyView(view)
        
        case .message:
            let view = Text("Message")
            return AnyView(view)
        
        case .profile:
            let view = ProfileView()
            return AnyView(view)
        }
    }
    
    var body: some View {
        ZStack {
            Color(.systemGray6)
                .opacity(0.35)
                .edgesIgnoringSafeArea(.vertical)
            
            VStack {
                HStack {
                    Spacer()
                    
                    TabBarButtonView(type: .fire)
                    
                    Spacer()
                    
                    TabBarButtonView(type: .star)
                    
                    Spacer()
                    
                    TabBarButtonView(type: .message)
                    
                    Spacer()
                    
                    TabBarButtonView(type: .profile) 
                    
                    Spacer()
                }
                .frame(height: 64)
                .padding(.top, 32)
                
                // Call to load the relevant view based on the current value
                // of appState.selectedTab. The appState declared at the top
                // of the file is passed in from the App/ContentView.
                presentViewForState()
                
                Spacer()
            }
            .edgesIgnoringSafeArea(.vertical)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environmentObject(AppStateManager())
    }
}

