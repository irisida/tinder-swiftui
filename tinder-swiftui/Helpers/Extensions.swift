//
//  Extensions.swift
//  tinder-swiftui
//
//  Created by ed on 22/05/2021.
//

import SwiftUI


// Extension which returns a view. It operates by adding the
// ability to take a condition and run the if func returning
// the transformed view in truth vases or the non-transormed
// view when falsy.
extension View {
    @ViewBuilder
    func `if`<Transform: View>(
        _ condition: Bool,
        transform: (Self) -> Transform
    ) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}

extension View {
    func endEditing(_ force: Bool) {
        UIApplication.shared.windows.forEach { $0.endEditing(force)}
    }
}

// viewModifier for NavigationViews to remove the
// out-the-box features for titles and navBar.
struct HideNavigationView: ViewModifier {
    func body(content: Content) -> some View {
        content
            .navigationTitle("")
            .navigationBarHidden(true)
    }
}


struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners,  cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}
