//
//  CardView.swift
//  tinder-swiftui
//
//  Created by ed on 25/05/2021.
//

import SwiftUI

struct CardView: View {
    
    @State var person: Person
    @Binding var fullScreenMode: Bool
    
    let screenCutOff = (UIScreen.main.bounds.width / 2) * 0.8
    
    var body: some View {
        GeometryReader { geo in
            if fullScreenMode {
                FullScreenCardView(person: person,
                                   fullScreenMode: $fullScreenMode)
            } else {
                CardImageScroller(person: person, fullScreenMode: $fullScreenMode)
                    .animation(.easeOut(duration: 0.2))
                    .frame(width: geo.size.width - 24, height: geo.size.height)
                    .padding(.leading, 12)
                    .offset(x: person.x, y: person.y)
                    .rotationEffect(.degrees(person.degree))
                    .gesture(
                        DragGesture()
                            .onChanged({ value in
                                withAnimation(.default) {
                                    person.x = value.translation.width
                                    person.y = value.translation.height
                                    withAnimation {
                                        // controls the strength of the roatation
                                        person.degree = Double((value.translation.width / 25) * -1)
                                    }
                                }
                            })
                            .onEnded({ value in
                                withAnimation(.interpolatingSpring(mass: 1.0, stiffness: 50, damping: 10, initialVelocity: 0)) {
                                    let width = value.translation.width
                                 
                                    // set the 4 possibilities for:
                                    
                                    // snapback from left
                                    if width <= -1 && width >= -screenCutOff {
                                        person.x = 0
                                        person.y = 0
                                        person.degree = 0
                                    }
                                    
                                    // swiped to left
                                    if width < -screenCutOff {
                                        person.x = -500
                                        person.degree = -12
                                    }
                                    
                                    // snap back from right
                                    if width >= 0 && width <= screenCutOff {
                                        person.x = 0
                                        person.y = 0
                                        person.degree = 0
                                    }
                                    
                                    // swiped to right
                                    if width > screenCutOff {
                                        person.x = 500
                                        person.degree = 12
                                    }
                                    
                                    
                                }
                            })
                    )
            }
        }
        
        
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(person: Person.example3, fullScreenMode: .constant(false))
        CardView(person: Person.example3, fullScreenMode: .constant(true))
    }
}
