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
    var distance: Int
    
    var bioLong: String
    
    var age: Int
    
    // used for card manipulation
    var x: CGFloat = 0.0
    var y: CGFloat = 0.0
    var degree: Double = 0.0
}



// extesions for mock data
extension Person {
    static let example1 = Person(name: "Tatiana",
                                 imageUrls: [
                                  URL(string: "https://picsum.photos/400")!,
                                  URL(string: "https://picsum.photos/400/411")!,
                                  URL(string: "https://picsum.photos/400/412")!,
                                  URL(string: "https://picsum.photos/400/413")!
                                 ],
                                 bio: "Loves dogs, walks and autumn",
                                 distance: 20,
                                 bioLong: "Loves dogs, walks and autumn",
                                 age: 21)
    
    static let example2 = Person(name: "Arabella",
                                 imageUrls: [
                                  URL(string: "https://picsum.photos/401")!,
                                  URL(string: "https://picsum.photos/401/411")!,
                                  URL(string: "https://picsum.photos/401/412")!,
                                  URL(string: "https://picsum.photos/401/413")!
                                 ],
                                 bio: "Looks for charm and confidence",
                                 distance: 16,
                                 bioLong: "Looks for charm and confidence",
                                 age: 25)
    
    static let example3 = Person(name: "Helena",
                                 imageUrls: [
                                    URL(string: "https://picsum.photos/402/405")!,
                                    URL(string: "https://picsum.photos/402/404")!,
                                    URL(string: "https://picsum.photos/402/403")!,
                                    URL(string: "https://picsum.photos/402/402")!,
                                 ],
                                 bio: "Has simple needs. Honesty and honour. No messing around will be tolerated. Get your jokes out, get your best moves polished too.",
                                 distance: 31,
                                 bioLong: "Has simple needs. Honesty and honour. No messing around will be tolerated. Get your jokes out, get your best moves polished too.",
                                 age: 29)
    
    // collections
    static let examples: [Person] = [
        Person(name: "Mari",
               imageUrls: [
                URL(string: "https://picsum.photos/390")!,
                URL(string: "https://picsum.photos/390/391")!,
                URL(string: "https://picsum.photos/390/392")!,
                URL(string: "https://picsum.photos/390/393")!
               ],
               bio: "Likes men",
               distance: 12,
               bioLong: "same as bio",
               age: 31),
        
        Person(name: "Mae",
               imageUrls: [
                URL(string: "https://picsum.photos/391")!,
                URL(string: "https://picsum.photos/391/392")!,
                URL(string: "https://picsum.photos/391/393")!,
                URL(string: "https://picsum.photos/391/394")!
               ],
               bio: "Likes men",
               distance: 13,
               bioLong: "same as bio",
               age: 28),
        
        Person(name: "Tammi",
               imageUrls: [
                URL(string: "https://picsum.photos/392")!,
                URL(string: "https://picsum.photos/392/393")!,
                URL(string: "https://picsum.photos/392/394")!,
                URL(string: "https://picsum.photos/392/395")!
               ],
               bio: "Likes men",
               distance: 22,
               bioLong: "same as bio",
               age: 36),
        
        Person(name: "Shandi",
               imageUrls: [
                URL(string: "https://picsum.photos/393")!,
                URL(string: "https://picsum.photos/393/394")!,
                URL(string: "https://picsum.photos/393/395")!,
                URL(string: "https://picsum.photos/393/396")!
               ],
               bio: "Likes men and women",
               distance: 30,
               bioLong: "same as bio",
               age: 39),
        
        Person(name: "Tori",
               imageUrls: [
                URL(string: "https://picsum.photos/394")!,
                URL(string: "https://picsum.photos/394/395")!,
                URL(string: "https://picsum.photos/394/396")!,
                URL(string: "https://picsum.photos/394/397")!
               ],
               bio: "Likes men and dogs",
               distance: 41,
               bioLong: "same as bio",
               age: 22),
    ]
    
    
    static let topPicksExamples: [Person] = [
        Person(name: "Aria",
               imageUrls: [
                URL(string: "https://picsum.photos/410")!,
                URL(string: "https://picsum.photos/410/411")!,
                URL(string: "https://picsum.photos/410/412")!,
                URL(string: "https://picsum.photos/410/413")!
               ],
               bio: "Likes men",
               distance: 46,
               bioLong: "same as bio",
               age: 26),
        
        Person(name: "Bea",
               imageUrls: [
                URL(string: "https://picsum.photos/411")!,
                URL(string: "https://picsum.photos/411/412")!,
                URL(string: "https://picsum.photos/411/413")!,
                URL(string: "https://picsum.photos/411/414")!
               ],
               bio: "Likes men and women",
               distance: 8,
               bioLong: "same as bio",
               age: 28),
        
        Person(name: "Clarice",
               imageUrls: [
                URL(string: "https://picsum.photos/412")!,
                URL(string: "https://picsum.photos/412/413")!,
                URL(string: "https://picsum.photos/412/414")!,
                URL(string: "https://picsum.photos/412/415")!
               ],
               bio: "Likes men",
               distance: 3,
               bioLong: "same as bio",
               age: 23),
        
        Person(name: "Dani",
               imageUrls: [
                URL(string: "https://picsum.photos/413")!,
                URL(string: "https://picsum.photos/413/414")!,
                URL(string: "https://picsum.photos/413/415")!,
                URL(string: "https://picsum.photos/413/416")!
               ],
               bio: "Likes men",
               distance: 52,
               bioLong: "same as bio",
               age: 31),
        
        Person(name: "Evaline",
               imageUrls: [
                URL(string: "https://picsum.photos/414")!,
                URL(string: "https://picsum.photos/414/414")!,
                URL(string: "https://picsum.photos/414/416")!,
                URL(string: "https://picsum.photos/414/417")!
               ],
               bio: "Likes men and women",
               distance: 4,
               bioLong: "same as bio",
               age: 34),
        
        Person(name: "Fay",
               imageUrls: [
                URL(string: "https://picsum.photos/415")!,
                URL(string: "https://picsum.photos/415/416")!,
                URL(string: "https://picsum.photos/415/417")!,
                URL(string: "https://picsum.photos/415/418")!
               ],
               bio: "Likes men",
               distance: 18,
               bioLong: "same as bio",
               age: 28),
        
        Person(name: "Gigi",
               imageUrls: [
                URL(string: "https://picsum.photos/416")!,
                URL(string: "https://picsum.photos/416/417")!,
                URL(string: "https://picsum.photos/416/418")!,
                URL(string: "https://picsum.photos/416/419")!
               ],
               bio: "Likes men",
               distance: 21,
               bioLong: "same as bio",
               age: 36),
        
        Person(name: "Henrietta",
               imageUrls: [
                URL(string: "https://picsum.photos/417")!,
                URL(string: "https://picsum.photos/417/418")!,
                URL(string: "https://picsum.photos/417/419")!,
                URL(string: "https://picsum.photos/417/420")!
               ],
               bio: "Likes men and women",
               distance: 15,
               bioLong: "same as bio",
               age: 39),
        
        Person(name: "Isla",
               imageUrls: [
                URL(string: "https://picsum.photos/418")!,
                URL(string: "https://picsum.photos/418/401")!,
                URL(string: "https://picsum.photos/418/402")!,
                URL(string: "https://picsum.photos/418/403")!
               ],
               bio: "Likes men and dogs",
               distance: 7,
               bioLong: "same as bio",
               age: 22),
    ]
}
