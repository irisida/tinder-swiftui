//
//  AppStateManager.swift
//  tinder-swiftui
//
//  Created by ed on 22/05/2021.
//

import Foundation

class AppStateManager: ObservableObject {
    @Published var selectedTab: TabBarButtonType = .fire
}
