//
//  Message.swift
//  tinder-swiftui
//
//  Created by ed on 23/05/2021.
//

import Foundation

struct Message: Hashable {

    var content: String
    var person: Person? = nil
    
    var fromCurrentUser: Bool {
        return person == nil 
    }
}

extension Message {
    static let exampleSent = Message(content: "Hi. I'm a sample sent message")
    static let exampleReceived = Message(content: "Hi. I'm a sample received message", person: Person.example1)
}
