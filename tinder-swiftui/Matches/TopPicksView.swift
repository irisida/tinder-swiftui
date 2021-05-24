//
//  TopPicksView.swift
//  tinder-swiftui
//
//  Created by ed on 24/05/2021.
//

import SwiftUI

struct TopPicksView: View {
    @EnvironmentObject var userMgr: UserManager
    @EnvironmentObject var appState: AppStateManager
    
    private var user: User {
        return userMgr.currentUser
    }
    
    var body: some View {
        ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: false, content: {
            
            if !user.goldSubscriber {
                Text("Upgrade to Gold for more Top Picks")
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .foregroundColor(.textTitle)
                    .font(.system(size: 16, weight: .medium))
                    .padding(.horizontal, 40)
                    .padding(.vertical, 16)
            }
            
            LazyVGrid(
                columns: [GridItem(.flexible()), GridItem(.flexible())],
                alignment: .center,
                spacing: 8,
                pinnedViews: [],
                content: {
                    ForEach(userMgr.topPicks) { person in
                        PersonSquare(person: person, isBlurred: false)
                            .frame(height: 240)
                            .onTapGesture {
                                personIsTapped(person)
                            }
                    }
            })
                .padding(.horizontal, 8)
            
        })
    }
    
    func personIsTapped(_ person: Person) {
        if user.goldSubscriber {
            appState.showPersonsProfile(person)
        } else {
            appState.showPurchaseScreen()
        }
    }
}

struct TopPicksView_Previews: PreviewProvider {
    static var previews: some View {
        TopPicksView()
            .environmentObject(UserManager())
            .environmentObject(AppStateManager())
        
    }
}

