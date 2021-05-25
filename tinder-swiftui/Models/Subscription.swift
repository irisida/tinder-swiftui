//
//  Subscription.swift
//  tinder-swiftui
//
//  Created by ed on 24/05/2021.
//

import Foundation

struct Subscription: Identifiable {
    let id = UUID().uuidString
    
    var month: Int
    var monthlyCost: Double
    var totalCost: Double
    var savedPercent: Int?
    var tagLine: TagLine = .none
    
    enum TagLine: String {
        case mostPopular = "Most Popular"
        case bestValue = "Best Value"
        case none
    }
    
}


extension Subscription {
    static let example1 = Subscription(month: 6, monthlyCost: 15.00, totalCost: 89.99, savedPercent: 50, tagLine: .bestValue)
    
    static let example2 = Subscription(month: 3, monthlyCost: 20.00, totalCost: 59.99, savedPercent: 30, tagLine: .mostPopular)
    
    static let example3 = Subscription(month: 1, monthlyCost: 29.99, totalCost: 29.99)
    
}
