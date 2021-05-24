//
//  User.swift
//  tinder-swiftui
//
//  Created by ed on 24/05/2021.
//

import Foundation


struct User {
    var name: String
    
    var goldSubscriber: Bool = false
}


extension User {
    static let example = User(name: "Tatiana", goldSubscriber: false)
}
