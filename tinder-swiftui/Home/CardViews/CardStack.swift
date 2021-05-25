//
//  CardStack.swift
//  tinder-swiftui
//
//  Created by ed on 25/05/2021.
//

import SwiftUI

struct CardStack: View {
    var people: [Person]
    
    @State private var fullScreenMode: Bool = false
    
    let screen = UIScreen.main.bounds
    
    var body: some View {
        ZStack {
            ForEach(people) { person in
                CardView(person: person, fullScreenMode: $fullScreenMode)
            }
        }
        .frame(width: screen.width, height: fullScreenMode ? screen.height : screen.height * 0.7)
    }
}

struct CardStack_Previews: PreviewProvider {
    static var previews: some View {
        CardStack(people: Person.topPicksExamples)
    }
}
