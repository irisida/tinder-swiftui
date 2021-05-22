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
