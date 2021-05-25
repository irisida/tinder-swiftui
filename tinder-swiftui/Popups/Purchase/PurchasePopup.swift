//
//  PurchasePopup.swift
//  tinder-swiftui
//
//  Created by ed on 24/05/2021.
//

import SwiftUI

struct PurchasePopup: View {
    
    @Binding var isVisible: Bool
    
    @State private var selectedIndex: Int = 1
    
    let screen = UIScreen.main.bounds
    
    let subscriptions: [Subscription] = [
        // network for all sub types
        Subscription.example1,
        Subscription.example2,
        Subscription.example3
    ]
    
    func processPayment() {
        // gateway to BE and pay process
        let product = subscriptions[selectedIndex]
    }
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                
                Spacer().frame(height: 40)
                
                VStack {
                    Text("Get Tinder Gold")
                        .foregroundColor(.yellow)
                        .font(.system(size: 24, weight: .bold))
                    
                    PurchaseSwipePromo()
                        .frame(height: geo.size.height / 3)
                        .padding(.top, -30)
                        
                    
                    HStack {
                        ForEach(subscriptions.indices) { subIndex in
                            let sub = subscriptions[subIndex]
                            
                            PurchaseOptionView(sub: sub, isSelected: subIndex == selectedIndex)
                                .onTapGesture(perform: {
                                    selectedIndex = subIndex
                                })
                        }
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        processPayment()
                    }, label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                .foregroundColor(.yellow)
                            
                            Text("Continue")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .heavy))
                        }
                    })
                    .frame(height: 55)
                    .padding(.horizontal, 24)
                    .padding(.top, 16)
                    
                    
                    
                    Button(action: {
                        isVisible = false
                    }, label: {
                        Text("No Thanks")
                            .foregroundColor(.textPrimary)
                            .font(.system(size: 18, weight: .heavy))
                    })
                    .padding(.vertical, 16)
                    
                    
                }
                .frame(width: geo.size.width)
                .padding(.vertical, 20)
                .background(
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .foregroundColor(.white)
            )
                
                Spacer()
                
                VStack(spacing: 6) {
                    Text("Recurring billing, cancel anytime.")
                        .foregroundColor(.lightNotWhite)
                        .font(.system(size: 14, weight: .semibold))
                    
                    Text("This is an example paragraph of legalise. It is intended to demonstrate some type of multiline document string representative of terms and conditions.")
                        .foregroundColor(.lightSmallprint)
                        .font(.system(size: 14, weight: .medium))
                        .multilineTextAlignment(.center)
                }
                .padding(.bottom, 24)
                .padding(.horizontal, 4)
                
                Spacer()
            }
            .background(Color.black.edgesIgnoringSafeArea(.all))
            
        }
        .frame(height: screen.height)
        
        
    }
}

struct PurchasePopup_Previews: PreviewProvider {
    static var previews: some View {
        PurchasePopup(isVisible:.constant(true))
    }
}
