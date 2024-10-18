//
//  HomeViewModel.swift
//  LocalPass
//
//  Created by Reuben on 21/09/2024.
//

import Foundation

class HomeViewModel : ObservableObject {
    // View properties
    @Published private(set) var homeViewSettings: HomeViewSettings
    
    // Child view properties
    @Published private(set) var theme: Theme
    
    init(
        homeViewSettings: HomeViewSettings,
        theme: Theme
    ) {
        self.homeViewSettings = homeViewSettings
        
        self.theme = theme
    }
}
