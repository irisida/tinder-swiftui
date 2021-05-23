//
//  MessageThread.swift
//  tinder-swiftui
//
//  Created by ed on 23/05/2021.
//

import Foundation

struct MessagePreview {
    var person: Person
    var lastMessage: String
}


extension MessagePreview {
    static let example = MessagePreview(person: Person.example,
                                        lastMessage: "Hi there. How are you?")
}
