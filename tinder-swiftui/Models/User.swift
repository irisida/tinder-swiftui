//
//  User.swift
//  tinder-swiftui
//
//  Created by ed on 24/05/2021.
//

import Foundation


struct User {
    var name: String
    var age: Int
    var jobTitle: String
    
    var goldSubscriber: Bool = false
    var profileTip: String = ""
    
    var imageUrls: [URL] = []
}


extension User {
    static let example = User(name: "Tatiana",
                              age: 32,
                              jobTitle: "Developer advocate",
                              goldSubscriber: false,
                              profileTip: "Photo Tip: Make sure you have good lighting. Good quality photos get more likes",
                              imageUrls: [URL(string: "https://picsum.photos/400")!])
}
