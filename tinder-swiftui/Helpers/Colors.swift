//
//  Colors.swift
//  tinder-swiftui
//
//  Created by ed on 22/05/2021.
//

import Foundation
import SwiftUI

extension Color {
    static let activeTabGray = Color("active_tab_gray")
    
    // text handlers to take the edge of stark black
    static let lightNotWhite = Color(.systemGray6).opacity(0.90)
    static let lightSmallprint = Color(.systemGray6).opacity(0.60)
    
    static let darkNotBlack = Color.black.opacity(0.65)
    static let textPrimary = Color.gray.opacity(0.9)
    static let textSecondary = Color.gray.opacity(0.6)
    static let textTitle = Color.black.opacity(0.75)
    
    // app background
    static let defaultBackground = Color(.systemGray6).opacity(0.35)
    static let panelBackground = Color(.systemGray4).opacity(0.55)
    
    // drop shadow colors
    static let lightDropShadow = Color.gray.opacity(0.15)
    static let mediumDropShadow = Color.gray.opacity(0.50)
    static let darkerDropShadow = Color.gray.opacity(0.65)
    
    static let textFieldBackground = Color(.systemGray6)
}
