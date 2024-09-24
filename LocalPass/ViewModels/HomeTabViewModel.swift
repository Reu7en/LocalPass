//
//  HomeTabViewModel.swift
//  LocalPass
//
//  Created by Reuben on 21/09/2024.
//

import Foundation

class HomeTabViewModel: ObservableObject {
    @Published private(set) var showAccounts: Bool
    @Published private(set) var showNotes: Bool
    @Published private(set) var showCards: Bool
    @Published private(set) var showIdentities: Bool

    init(
        homeTabViewSettings: HomeTabViewSettings
    ) {
        self.showAccounts = homeTabViewSettings.showAccounts.value
        self.showNotes = homeTabViewSettings.showNotes.value
        self.showCards = homeTabViewSettings.showCards.value
        self.showIdentities = homeTabViewSettings.showIdentities.value
    }
}
