//
//  Person.swift
//  tinder-swiftui
//
//  Created by ed on 23/05/2021.
//

import Foundation

struct Person: Hashable {
    var name: String
    var imageUrls: [URL]
    var bio: String
}


extension Person {
    static let example1 = Person(name: "Tatiana",
                                 imageUrls: [URL(string: "https://picsum.photos/400")!],
                                 bio: "Loves dogs, walks and autumn")
    
    static let example2 = Person(name: "Arabella",
                                 imageUrls: [URL(string: "https://picsum.photos/401")!],
                                 bio: "Looks for charm and confidence")
    
    static let example3 = Person(name: "Helena",
                                 imageUrls: [URL(string: "https://picsum.photos/402")!],
                                 bio: "Has simple needs. Honesty and honour.")
}
