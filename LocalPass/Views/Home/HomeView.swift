//
//  HomeView.swift
//  LocalPass
//
//  Created by Reuben on 21/09/2024.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var homeViewModel: HomeViewModel
    
    var body: some View {
        HomeTabView(homeTabViewModel: HomeTabViewModel(homeTabViewSettings: homeViewModel.homeViewSettings.homeTabViewSettings))
    }
}

#Preview {
    HomeView(homeViewModel: HomeViewModel(homeViewSettings: HomeViewSettings()))
}
