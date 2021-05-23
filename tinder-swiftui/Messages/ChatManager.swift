//
//  ChatManager.swift
//  tinder-swiftui
//
//  Created by ed on 23/05/2021.
//

import Foundation


class ChatManager: ObservableObject {
    @Published var messages: [Message] = []
    
    private var person: Person
    
    init(person: Person) {
        self.person = person
        loadMessages()
    }
    
    public func sendMessage(_ message: Message) {
        // networking calls
        messages.append(message)
    }
    
    private func loadMessages() {
        messages = [Message.exampleSent, Message.exampleReceived]
    }
}
