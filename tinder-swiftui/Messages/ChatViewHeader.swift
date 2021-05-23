//
//  ChatViewHeader.swift
//  tinder-swiftui
//
//  Created by ed on 23/05/2021.
//

import SwiftUI

struct ChatViewHeader: View {
    
    @Environment(\.presentationMode) var presenetationMode
    
    let name: String
    let imageUrl: URL?
    let videoAction: ()-> Void
    
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.top)
                .shadow(radius: 3)
            
            HStack {
                // back button
                Button(action: {
                    presenetationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.textPrimary)
                        .font(.system(size: 22, weight: .semibold))
                })
                
                Spacer()
                
                VStack(spacing: 6) {
                    RoundedImage(url: imageUrl)
                        .frame(height: 32)
                    
                    Text(name)
                        .foregroundColor(Color.textSecondary)
                        .font(.system(size: 14))
                }
                
                Spacer()
                
                Button(action: {
                    videoAction()
                }, label: {
                    Image(systemName: "video.fill")
                        .font(.system(size: 18, weight: .bold))
                })
            }
            .padding(.horizontal, 24)
            .padding(.vertical, 8)
        }
        .frame(height: 50)
    }
}

struct ChatViewHeader_Previews: PreviewProvider {
    static var previews: some View {
        let person = Person.example
        
        ChatViewHeader(name: person.name,
                       imageUrl: person.imageUrls.first,
                       videoAction: {
                            //
                       })
    }
}
