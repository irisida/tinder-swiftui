//
//  PersonSquare.swift
//  tinder-swiftui
//
//  Created by ed on 24/05/2021.
//

import SwiftUI
import KingfisherSwiftUI

struct PersonSquare: View {
    var person: Person
    var isBlurred: Bool
    
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .bottomLeading) {
                KFImage(person.imageUrls.first)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geo.size.width, height: geo.size.height)
                    .if(isBlurred) {
                        $0.blur(radius: 25)
                    }
                
                Text("\(person.name), \(person.age)")
                    .padding()
                    .foregroundColor(.white)
                    .font(.system(size: 18, weight: .semibold))
                    .if(isBlurred) {
                        $0.redacted(reason: .placeholder)
                    }
            }
            .cornerRadius(16)
        }
    }
}

struct PersonSquare_Previews: PreviewProvider {
    static var previews: some View {
        PersonSquare(person: Person.example1, isBlurred: true)
            .frame(width: 200, height: 240)
    }
}
