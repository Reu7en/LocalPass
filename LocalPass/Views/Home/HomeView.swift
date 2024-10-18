//
//  HomeView.swift
//  LocalPass
//
//  Created by Reuben on 21/09/2024.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        Text("foo")
    }
}

#Preview {
    HomeView(
        viewModel: HomeViewModel(
            homeViewSettings: HomeViewSettings(),
            theme: Theme.defaultTheme
        )
    )
}
