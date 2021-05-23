//
//  MessageListView.swift
//  tinder-swiftui
//
//  Created by ed on 23/05/2021.
//

import SwiftUI

struct MessageListView: View {
    
    @ObservedObject var viewModel: MessageListViewModel = MessageListViewModel()
    
    @State private var searchText: String = ""
    @State private var isEditing: Bool = false
    
    var body: some View {
        Group {
            ScrollView {
                HStack {
                    TextField("Search matches", text: $searchText)
                        .padding(8)
                        .padding(.horizontal, 25)
                        .background(Color.textFieldBackground)
                        .cornerRadius(8)
                        .overlay(
                            HStack {
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(.textPrimary)
                                    .font(.system(size: 20, weight: .bold))
                                    .padding(.leading, 4)
                                Spacer()
                            }
                        )
                        .padding(.horizontal, 12)
                        .onTapGesture {
                            self.isEditing = true
                        }
                        .animation(.easeIn(duration: 0.25))
                    
                    if isEditing {
                        Button(action: {
                            self.isEditing = false
                            self.searchText = ""
                            self.endEditing(true)
                        }, label: {
                            Text("Cancel")
                        })
                        .padding(.trailing, 12)
                        .transition(.move(edge: .trailing))
                        .animation(.easeIn(duration: 0.25))
                    }
                }
                
                Spacer().frame(height: 16)
                
            
                ZStack {
                    VStack {
                        ForEach(viewModel.messagePreviews
                                    .filter({ searchText.isEmpty ? true : displayPreview($0) }), id: \.self ) { preview in
                            
                            NavigationLink(
                                destination: ChatView(person: preview.person),
                                label: {
                                    MessageRowView(preview: preview)
                                })
                                .buttonStyle(PlainButtonStyle())
                                .animation(.easeIn(duration: 0.25))
                                .transition(.slide)
                            
                            
                        }
                    }
                    
                    // triger the overlay to focus the user
                    // on the search feature.
                    if isEditing && searchText.isEmpty {
                        Color.white.opacity(0.6)
                    }
                }
                
                Spacer()
                
            }
        }
        .modifier(HideNavigationView())
    }
    
    func displayPreview(_ preview: MessagePreview) -> Bool {
        // Filter bazed on persons name, the last
        // message sent text value and the text of
        // a users bio.
        
        if preview.person.name.lowercased().contains(searchText.lowercased()) { return true }
        
        if preview.lastMessage.lowercased().contains(searchText.lowercased()) { return true }
        
        if preview.person.bio.lowercased().contains(searchText.lowercased()) { return true }
        
        return false
    }
}

struct MessageListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MessageListView()
        }
        
    }
}
