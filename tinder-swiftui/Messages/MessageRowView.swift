//
//  MessageRowView.swift
//  tinder-swiftui
//
//  Created by ed on 23/05/2021.
//

import SwiftUI
import KingfisherSwiftUI

struct MessageRowView: View {
    
    var preview: MessagePreview
    
    var body: some View {
        HStack {
            RoundedImage(url: preview.person.imageUrls.first)
                .frame(height: 70)
            
            VStack(alignment: .leading, spacing: 8) {
                Text(preview.person.name)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.darkNotBlack)
                
                Text(preview.lastMessage)
                    .foregroundColor(.textPrimary)
                    .lineLimit(1)
                    .multilineTextAlignment(.leading)
            }
            
            Spacer()
        }
        .padding(.horizontal, 8)
    }
}

struct MessageRowView_Previews: PreviewProvider {
    static var previews: some View {
        MessageRowView(preview: MessagePreview.example)
    }
}
