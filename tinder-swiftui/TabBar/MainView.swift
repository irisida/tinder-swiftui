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
            let view = HomeView()
            return AnyView(view)
            
        case .star:
            let view = MatchesView()
            return AnyView(view)
        
        case .message:
            let view = MessageListView()
            return AnyView(view)
        
        case .profile:
            let view = ProfileView()
            return AnyView(view)
        }
    }
    
    var body: some View {
        NavigationView {
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
                
                // check if we're shoeing the purchasing popup or not
                if appState.showPurchasePopup {
                    PurchasePopup(isVisible: $appState.showPurchasePopup)
                        .animation(.spring(response: 0.50,
                                           dampingFraction: 0.65,
                                           blendDuration: 0.1))
                        .transition(.offset(y: 800))
                }
            }
            .modifier(HideNavigationView())
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(AppStateManager())
            .environmentObject(UserManager())
    }
}

