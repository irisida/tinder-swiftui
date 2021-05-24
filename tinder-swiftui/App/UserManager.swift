//
//  UserManager.swift
//  tinder-swiftui
//
//  Created by ed on 24/05/2021.
//

import Foundation

class UserManager: ObservableObject {
    @Published var currentUser: User = User(name: "")
    @Published var matches: [Person] = []
    @Published var topPicks: [Person] = []
    
    init() {
        loadUser()
        loadMatches()
        loadTopPicks()
    }
    
    private func loadUser() {
        // replace by netwroking call to load user from server
        self.currentUser = User.example
    }
    
    private func loadMatches() {
        // replace by netwroking call to load matches from server
        self.matches = Person.examples.shuffled()
    }
    
    private func loadTopPicks() {
        // replace by netwroking call to load matches from server
        self.topPicks = Person.topPicksExamples.shuffled()
    }
}


