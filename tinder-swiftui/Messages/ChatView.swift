//
//  ChatView.swift
//  tinder-swiftui
//
//  Created by ed on 23/05/2021.
//

import SwiftUI

struct ChatView: View {
    @ObservedObject var chatMgr: ChatManager
    
    @State private var typedMessage: String = ""
    
    @State private var scrollProxy: ScrollViewProxy? = nil
    
    private var person: Person
    
    init(person: Person) {
        self.person = person
        self.chatMgr = ChatManager(person: person)
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            
            VStack {
                Spacer().frame(height: 64)
                
                ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: false, content: {
                    ScrollViewReader { proxy in
                        
                        LazyVStack {
                            ForEach(chatMgr.messages.indices, id: \.self) { index in
                                let msg = chatMgr.messages[index]
                                
                                MessageView(message: msg)
                                    .id(index)
                                    .animation(.easeIn)
                                    .transition(.move(edge: msg.fromCurrentUser ? .trailing : .leading))
                            }
                        }
                        .onAppear(perform: {
                            scrollProxy = proxy
                        })
                        
                    }
                })
                
                ZStack(alignment: .trailing) {
                    Color.textFieldBackground
                    
                    TextField("Type your message", text: $typedMessage)
                        .foregroundColor(Color.darkNotBlack)
                        .textFieldStyle(PlainTextFieldStyle())
                        .frame(height: 45)
                        .padding(.horizontal)
                    
                    Button(action: {
                        if !typedMessage.isEmpty {
                            sendMessage()
                        }
                    }, label: {
                        Text("Send")
                    })
                    .padding(.horizontal)
                    .foregroundColor(typedMessage.isEmpty ? .gray : .blue)
                    
                }
                .frame(height: 40)
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.textSecondary.opacity(0.5), lineWidth: 1)
                )
                .padding(.horizontal, 8)
            }
            
            ChatViewHeader(name: person.name, imageUrl: person.imageUrls.first) {
                //
            }
        }
        .modifier(HideNavigationView())
        .onChange(of: chatMgr.keyboardIsShowing, perform: { value in
            if value {
                // scroll to the bottom to handle for the
                // fact the keyboard is showing.
                scrollToBottomOfChat()
            }
        })
        .onChange(of: chatMgr.messages, perform: { _ in
            scrollToBottomOfChat()
        })
    }
    
    
    func sendMessage() {
        chatMgr.sendMessage(Message(content: typedMessage))
        typedMessage = ""
    }
    
    func scrollToBottomOfChat() {
        withAnimation {
            scrollProxy?.scrollTo(chatMgr.messages.count - 1, anchor: .bottom)
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(person: Person.example1)
    }
}
