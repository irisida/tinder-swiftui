//
//  ProfileSwiprPromo.swift
//  tinder-swiftui
//
//  Created by ed on 23/05/2021.
//

import SwiftUI

struct ProfileSwipePromo: View {
    
    var action: ()-> Void
    
    var body: some View {
        VStack(spacing: 0) {
            TabView {
                // promo1
                VStack(spacing: 16) {
                    Spacer()
                    Text("Get Tinder Gold")
                        .font(.system(size: 26, weight: .semibold))
                    
                    Text("See who's liking you & more")
                }
                .padding(.bottom, 64)
                    
                // promo 2
                VStack(spacing: 16) {
                    Spacer()
                    Text("Get Matches Faster")
                        .font(.system(size: 26, weight: .semibold))
                    
                    Text("Match against the widest pool of profiles.")
                }
                .padding(.bottom, 64)
                
                // promo 3
                VStack(spacing: 16) {
                    Spacer()
                    Text("Increase Your Chances")
                        .font(.system(size: 26, weight: .semibold))
                    
                    Text("Boost your profile each month.")
                }
                .padding(.bottom, 64)
            }
            .tabViewStyle(PageTabViewStyle())
            .foregroundColor(Color.darkNotBlack)
            
            
            Button(action: {
                action()
            }, label: {
                Text("My Tinder Plus")
                    .foregroundColor(.red)
                    .font(.system(size: 18, weight: .semibold))
                    .padding(.vertical, 20)
                    .padding(.horizontal, 50)
                    .background(Color.white)
                    .cornerRadius(30)
                    .shadow(color: Color.mediumDropShadow, radius: 10, x: 1.25, y: 5)
            })
            .padding(.bottom, 32)
        }
        .padding(.bottom, 0)
    }
}

struct ProfileSwipePromo_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.panelBackground
                .edgesIgnoringSafeArea(.all)
            
            ProfileSwipePromo {
                print("Action was called from ProfileSwipePromo preview")
            }
        }
        .frame(height: 400)
    }
}
