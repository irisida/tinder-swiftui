//
//  MessageThread.swift
//  tinder-swiftui
//
//  Created by ed on 23/05/2021.
//

import Foundation

struct MessagePreview: Hashable {
    var person: Person
    var lastMessage: String
}


extension MessagePreview {
    static let example = MessagePreview(person: Person.example1,
                                        lastMessage: "Hi there. How are you? What is the schedule for today and do you have any availability at all?")
    
    static let examples: [MessagePreview] = [
        MessagePreview(person: Person.example1, lastMessage: "That was the best. It was great."),
        MessagePreview(person: Person.example2, lastMessage: "No I prefer Indian food to Thai."),
        MessagePreview(person: Person.example3, lastMessage: "I would rather go walking than clubbing."),
    ]
}
