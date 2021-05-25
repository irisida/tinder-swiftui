//
//  CircleButtonView.swift
//  tinder-swiftui
//
//  Created by ed on 25/05/2021.
//

import SwiftUI

enum ButtonType: String {
    case back = "gobackward"
    case no = "xmark"
    case star = "star.fill"
    case heart = "heart.fill"
    case lightning = "cloud.bolt.fill"
}

struct CircleButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background(
                Circle()
                    .foregroundColor(.white)
            )
            .scaleEffect(configuration.isPressed ? 0.6 : 1.0)
    }
}

// view modifier that allows to to take a view
// apply the modifiation (in this instance the
// color) and return the view.
struct ColorButton: ViewModifier {
    var type: ButtonType
    
    func body(content: Content) -> some View {
        switch type {
        case .back:
            return AnyView(content.foregroundColor(.green))
        
        case .no:
            return AnyView(content.foregroundColor(.red))
            
        case .star:
            return AnyView(content.foregroundColor(.yellow))
            
        case .heart:
            return AnyView(content.foregroundColor(.pink))
            
        case .lightning:
            return AnyView(content.foregroundColor(.purple))
        }
    }
}


struct CircleButtonView: View {
    var type: ButtonType
    var action: ()-> Void
    
    var body: some View {
        Button(action: action, label: {
            Image(systemName: type.rawValue)
                .resizable()
                .font(.system(size: 12, weight: .semibold))
                .aspectRatio(contentMode: .fit)
                .padding(13)
        })
        .buttonStyle(CircleButton())
        .modifier(ColorButton(type: type))
    }
}

struct CircleButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.gray.opacity(0.3).edgesIgnoringSafeArea(.all)
        
            VStack (spacing: 50) {
                CircleButtonView(type: .back) {
                    // does something
                }
                .frame(height: 50)
                
                CircleButtonView(type: .no) {
                    // does something
                }
                .frame(height: 50)
                
                CircleButtonView(type: .star) {
                    // does something
                }
                .frame(height: 50)
                
                CircleButtonView(type: .heart) {
                    // does something
                }
                .frame(height: 50)
                
                CircleButtonView(type: .lightning) {
                    // does something
                }
                .frame(height: 50)
            }
        }
    }
}
