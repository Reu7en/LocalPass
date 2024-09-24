//
//  HomeViewModel.swift
//  LocalPass
//
//  Created by Reuben on 21/09/2024.
//

import Foundation

class HomeViewModel : ObservableObject {
    @Published private(set) var homeViewSettings: HomeViewSettings
    
    init(
        homeViewSettings: HomeViewSettings
    ) {
        self.homeViewSettings = homeViewSettings
    }
}
