//
//  PurchaseOptionView.swift
//  tinder-swiftui
//
//  Created by ed on 24/05/2021.
//

import SwiftUI

struct PurchaseOptionView: View {
    
    var sub: Subscription
    var isSelected: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            Text("\(sub.month)")
                .font(.system(size: 44, weight: .light))
            
            Spacer().frame(height: 2)
            
            Text("month\(sub.month > 1 ? "s" : "")")
                .font(.system(size: 14, weight: .bold))
            
            Spacer().frame(height: 2)
            
            Text("£\(String(format: "%.2f", sub.monthlyCost))/mo")
                .foregroundColor(.textPrimary)
            
            Spacer().frame(height: 10)
            
            if sub.savedPercent != nil {
                Text("SAVE \(sub.savedPercent ?? 0)%")
                    .foregroundColor(.yellow)
                    .font(.system(size: 16, weight: .heavy))
            } else {
                Spacer().frame(height: 22)
            }
            
            Spacer().frame(height: 10)
            
            Text("£\(String(format: "%.2f", sub.totalCost))")
                .font(.system(size: 20, weight: .bold))
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 18)
        .if(!isSelected) {
            $0.foregroundColor(Color.textPrimary)
        }
        .if(isSelected && sub.tagLine == .none) {
            $0.overlay(RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .stroke(Color.yellow, lineWidth: 1.5)
                        
            )
        }
        .if(isSelected && sub.tagLine != .none) {
            $0.overlay(
                ZStack(alignment: .top) {
                    Rectangle()
                        .foregroundColor(.yellow)
                        .frame(height: 20)
                        .cornerRadius(10, corners: [.topLeft, .topRight])
                    
                    Text(sub.tagLine.rawValue)
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(.white)
                        .lineLimit(1)
                        .padding(.top, 2)
                        .padding(.horizontal, 6)
                        .minimumScaleFactor(0.1)
                    
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .stroke(Color.yellow, lineWidth: 1.5)
                }
            )
        }
    }
}

struct PurchaseOptionView_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            PurchaseOptionView(sub: Subscription.example1, isSelected: false)
            PurchaseOptionView(sub: Subscription.example2, isSelected: true)
            PurchaseOptionView(sub: Subscription.example3, isSelected: false)
        }
    }
}
