//
//  MatchesView.swift
//  tinder-swiftui
//
//  Created by ed on 24/05/2021.
//

import SwiftUI

struct MatchesView: View {
    
    @EnvironmentObject var userMgr: UserManager
    @EnvironmentObject var appState: AppStateManager
    
    @State private var selectedTab: likedTab = .likes
    
    enum likedTab {
        case likes
        case topPicks
    }
    
    private var buttonText: String {
        if selectedTab == .likes {
            return "See who likes you"
        } else {
            return "Unlock top picks"
        }
    }
    
    private func buttonAction() {
        appState.showPurchaseScreen()
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(spacing: 0) {
                HStack {
                    Spacer()
                    
                    // likes tab
                    Button(action: {
                        selectedTab = .likes
                    }, label: {
                        Text("\(userMgr.matches.count) Likes")
                            .font(.system(size: 18, weight: .semibold))
                            .if(selectedTab == .topPicks) {
                                $0.foregroundColor(.textPrimary)
                            }
                    })
                    .foregroundColor(.darkNotBlack)
                    .buttonStyle(PlainButtonStyle())
                    
                    Spacer()
                    
                    // top picks tab
                    Button(action: {
                        selectedTab = .topPicks
                    }, label: {
                        Text("\(userMgr.topPicks.count) Top picks")
                            .font(.system(size: 18, weight: .semibold))
                            .if(selectedTab == .likes) {
                                $0.foregroundColor(.textPrimary)
                            }
                    })
                    .foregroundColor(.darkNotBlack)
                    .buttonStyle(PlainButtonStyle())
                    
                    Spacer()
                }
                
                Divider()
                    .padding(.vertical)
                
                // control the displayed view from the
                // value of the selectedTab state var.
                if selectedTab == .likes {
                    LikesView()
                } else {
                    TopPicksView()
                }
                
                Spacer()
            }
            
            Button(action: {
                buttonAction()
            }, label: {
                Text(buttonText)
                    .padding(.vertical, 16)
                    .padding(.horizontal, 36)
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.white)
                    .background(Color.pink)
                    .cornerRadius(25)
            })
            .buttonStyle(PlainButtonStyle())
            .padding(.bottom, 32)
        }
    }
}

struct MatchesView_Previews: PreviewProvider {
    static var previews: some View {
        MatchesView()
            .environmentObject(UserManager())
            .environmentObject(AppStateManager())
    }
}
