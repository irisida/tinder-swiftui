//
//  MessageListViewModel.swift
//  tinder-swiftui
//
//  Created by ed on 23/05/2021.
//

import Foundation

class MessageListViewModel: ObservableObject {
    @Published var messagePreviews: [MessagePreview] = []
    
    init() {
        loadPreviews()
    }
    
    func loadPreviews() {
        // handle netorking layer
        self.messagePreviews = MessagePreview.examples
    }
}
