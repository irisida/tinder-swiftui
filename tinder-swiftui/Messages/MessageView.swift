//
//  MessageView.swift
//  tinder-swiftui
//
//  Created by ed on 23/05/2021.
//

import SwiftUI

struct MessageView: View {
    var message: Message
    
    var body: some View {
        HStack {
            if message.fromCurrentUser {
                Spacer()
            }
            
            Text(message.content)
                .padding(.vertical, 8)
                .padding(.horizontal, 24)
                .foregroundColor(message.fromCurrentUser ? .black : .white)
                .background(message.fromCurrentUser ? Color(.systemGray4) : Color.blue)
                .padding(.horizontal, 8)
                
            
            if !message.fromCurrentUser {
                Spacer()
            }
        }
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(message: Message.exampleSent)
    }
}
