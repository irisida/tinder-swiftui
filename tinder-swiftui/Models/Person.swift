//
//  Person.swift
//  tinder-swiftui
//
//  Created by ed on 23/05/2021.
//

import Foundation

struct Person {
    var name: String
    var imageUrls: [URL]
}


extension Person {
    static let example = Person(name: "Tatiana", imageUrls: [URL(string: "https://picsum.photos/400")!])
}
