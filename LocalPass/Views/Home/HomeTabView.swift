//
//  HomeTabView.swift
//  LocalPass
//
//  Created by Reuben on 30/09/2024.
//

import SwiftUI

struct HomeTabView: View {
    @ObservedObject var viewModel: HomeTabViewModel
    
    var body: some View {
        TabView {
            Group {
                if viewModel.showAccounts {
                    AccountsView(
                        viewModel: AccountsViewModel(
                            accounts: viewModel.accounts,
                            theme: viewModel.theme
                        )
                    )
                    .tabItem {
                        Label(viewModel.accountsLabel, systemImage: viewModel.accountsSystemImageName)
                    }
                    .badge("1")
                }
                
                if viewModel.showNotes {
                    NotesView()
                        .tabItem {
                            Label(viewModel.notesLabel, systemImage: viewModel.notesSystemImageName)
                        }
                        .badge("2")
                }
                
                if viewModel.showCards {
                    CardsView()
                        .tabItem {
                            Label(viewModel.cardsLabel, systemImage: viewModel.cardsSystemImageName)
                        }
                        .badge("3")
                }
                
                if viewModel.showIdentities {
                    IdentitiesView()
                        .tabItem {
                            Label(viewModel.identitiesLabel, systemImage: viewModel.identitiesSystemImageName)
                        }
                        .badge("4")
                }
                
                SettingsView()
                    .tabItem {
                        Label(viewModel.settingsLabel, systemImage: viewModel.settingsSystemImageName)
                    }
                    .badge("5")
                
#if DEBUG
                DebugView()
                    .tabItem {
                        Label(viewModel.debugLabel, systemImage: viewModel.debugSystemImageName)
                    }
                    .badge("!")
#endif
            }
            .toolbarBackground(.visible, for: .tabBar)
            .toolbarBackground(viewModel.primaryColor, for: .tabBar)
        }
        .tint(viewModel.accentColor)
    }
}

#Preview {
    HomeTabView(
        viewModel: HomeTabViewModel(
            userData: SampleUserData.data,
            homeTabViewSettings: HomeTabViewSettings(),
            theme: Theme.defaultTheme
        )
    )
}
