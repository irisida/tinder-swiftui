//
//  AppStateManager.swift
//  tinder-swiftui
//
//  Created by ed on 22/05/2021.
//

import Foundation

class AppStateManager: ObservableObject {
    @Published var selectedTab: TabBarButtonType = .fire
    
    @Published var showPersonsProfile: Person? = nil
    
    @Published var showPurchasePopup: Bool = false
    
    public func showPersonsProfile(_ person: Person) {
        self.showPersonsProfile = person
    }
    
    public func showPurchaseScreen() {
        self.showPurchasePopup = true
    }
}
