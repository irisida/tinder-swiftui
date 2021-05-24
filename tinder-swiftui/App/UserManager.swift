//
//  UserManager.swift
//  tinder-swiftui
//
//  Created by ed on 24/05/2021.
//

import Foundation

class UserManager: ObservableObject {
    @Published var currentUser: User = User(name: "")
    
    init() {
        loadUser()
    }
    
    private func loadUser() {
        // replace by netwroking call to load user from server
        self.currentUser = User.example
    }
}


