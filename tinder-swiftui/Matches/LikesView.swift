//
//  LikesView.swift
//  tinder-swiftui
//
//  Created by ed on 24/05/2021.
//

import SwiftUI

struct LikesView: View {
    @EnvironmentObject var userMgr: UserManager
    @EnvironmentObject var appState: AppStateManager
    
    private var user: User {
        return userMgr.currentUser
    }
    
    var body: some View {
        ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: false, content: {
            
            if !user.goldSubscriber {
                Text("Upgrade to Gold to see people who already liked you")
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
                    ForEach(userMgr.matches) { person in
                        PersonSquare(person: person, isBlurred: !user.goldSubscriber)
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

struct LikesView_Previews: PreviewProvider {
    static var previews: some View {
        LikesView()
            .environmentObject(UserManager())
            .environmentObject(AppStateManager())
        
    }
}
