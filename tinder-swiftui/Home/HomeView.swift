//
//  HomeView.swift
//  tinder-swiftui
//
//  Created by ed on 25/05/2021.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var userMgr: UserManager
    @EnvironmentObject var appState: AppStateManager
    
    var body: some View {
        VStack {
            CardStack(people: userMgr.cardPeople)
            
            Spacer()
            
            HStack {
                CircleButtonView(type: .back) {
                    appState.showPurchaseScreen()
                }
                
                Spacer()
                
                CircleButtonView(type: .no) {
                    if let person = userMgr.cardPeople.last {
                        userMgr.swipe(person, direction: .nope)
                    }
                }
                
                Spacer()
                
                CircleButtonView(type: .star) {
                    if let person = userMgr.cardPeople.last {
                        if userMgr.currentUser.goldSubscriber {
                            userMgr.superLike(person)
                        } else {
                            appState.showPurchaseScreen()
                        }
                    }
                }
                
                Spacer()
                
                CircleButtonView(type: .heart) {
                    if let person = userMgr.cardPeople.last {
                        userMgr.swipe(person, direction: .like)
                    }
                }
                
                Spacer()
                
                CircleButtonView(type: .lightning) {
                    appState.showPurchaseScreen()
                }
                
            }
            .frame(height: 55)
            .padding(.horizontal)
            .padding(.vertical, 24)
            
            //Spacer()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(UserManager())
            .environmentObject(AppStateManager())
    }
}
