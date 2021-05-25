//
//  Person.swift
//  tinder-swiftui
//
//  Created by ed on 23/05/2021.
//

import Foundation
import SwiftUI

struct Person: Hashable, Identifiable {
    
    let id = UUID().uuidString
    
    var name: String
    var imageUrls: [URL]
    var bio: String
    
    var age: Int
    
    // used for card manipulation
    var x: CGFloat = 0.0
    var y: CGFloat = 0.0
    var degree: Double = 0.0
}



// extesions for mock data
extension Person {
    static let example1 = Person(name: "Tatiana",
                                 imageUrls: [URL(string: "https://picsum.photos/400")!],
                                 bio: "Loves dogs, walks and autumn", age: 21)
    
    static let example2 = Person(name: "Arabella",
                                 imageUrls: [URL(string: "https://picsum.photos/401")!],
                                 bio: "Looks for charm and confidence", age: 25)
    
    static let example3 = Person(name: "Helena",
                                 imageUrls: [
                                    URL(string: "https://picsum.photos/402/405")!,
                                    URL(string: "https://picsum.photos/402/404")!,
                                    URL(string: "https://picsum.photos/402/403")!,
                                    URL(string: "https://picsum.photos/402/402")!,
                                 ],
                                 bio: "Has simple needs. Honesty and honour. No messing around will be tolerated. Get your jokes out, get your best moves polished too.", age: 29)
    
    static let examples: [Person] = [
        Person(name: "Mari", imageUrls: [URL(string: "https://picsum.photos/390")!], bio: "Likes men", age: 31),
        Person(name: "Mae", imageUrls: [URL(string: "https://picsum.photos/391")!], bio: "Likes men", age: 28),
        Person(name: "Tammi", imageUrls: [URL(string: "https://picsum.photos/392")!], bio: "Likes men", age: 36),
        Person(name: "Shandi", imageUrls: [URL(string: "https://picsum.photos/393")!], bio: "Likes men and women", age: 39),
        Person(name: "Tori", imageUrls: [URL(string: "https://picsum.photos/394")!], bio: "Likes men and dogs", age: 22),
    ]
    
    
    static let topPicksExamples: [Person] = [
        Person(name: "Aria", imageUrls: [URL(string: "https://picsum.photos/410")!], bio: "Likes men", age: 26),
        Person(name: "Bea", imageUrls: [URL(string: "https://picsum.photos/411")!], bio: "Likes men and women", age: 28),
        Person(name: "Clarice", imageUrls: [URL(string: "https://picsum.photos/412")!], bio: "Likes men", age: 23),
        Person(name: "Dani", imageUrls: [URL(string: "https://picsum.photos/413")!], bio: "Likes men", age: 31),
        Person(name: "Evaline", imageUrls: [URL(string: "https://picsum.photos/414")!], bio: "Likes men and women", age: 34),
        Person(name: "Fay", imageUrls: [URL(string: "https://picsum.photos/415")!], bio: "Likes men", age: 28),
        Person(name: "Gigi", imageUrls: [URL(string: "https://picsum.photos/416")!], bio: "Likes men", age: 36),
        Person(name: "Henrietta", imageUrls: [URL(string: "https://picsum.photos/417")!], bio: "Likes men and women", age: 39),
        Person(name: "Isla", imageUrls: [URL(string: "https://picsum.photos/418")!], bio: "Likes men and dogs", age: 22),
    ]
}
