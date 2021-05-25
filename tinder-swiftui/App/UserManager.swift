//
//  UserManager.swift
//  tinder-swiftui
//
//  Created by ed on 24/05/2021.
//

import Foundation

enum SwipeDirection {
    case like
    case nope
}

class UserManager: ObservableObject {
    @Published var currentUser: User = User(name: "", age: 21, jobTitle: "")
    @Published var matches: [Person] = []
    @Published var topPicks: [Person] = []
    @Published var cardPeople: [Person] = []
    
    init() {
        loadUser()
        loadMatches()
        loadTopPicks()
        loadCardPeople()
    }
    
    private func loadCardPeople() {
        self.matches = Person.examples.shuffled()
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
    
    public func swipe(_ person: Person, direction: SwipeDirection) {
        // make network call to update BE
        self.cardPeople.removeLast()
    }
    
    public func superLike(_ person: Person) {
        self.cardPeople.removeLast()
    }
}


