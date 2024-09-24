//
//  HomeTabView.swift
//  LocalPass
//
//  Created by Reuben on 21/09/2024.
//

import SwiftUI

struct HomeTabView: View {
    @ObservedObject var homeTabViewModel: HomeTabViewModel
    
    var body: some View {
        TabView {
            Group {
                if homeTabViewModel.showAccounts {
                    Color.red
                        .badge("1")
                        .tabItem {
                            switch DeviceInformationDataService.getDeviceType() {
                            case .iPhone:
                                Label("Accounts", systemImage: "lock.iphone")
                            case .iPad:
                                Label("Accounts", systemImage: "lock.ipad")
                            case .iMac:
                                Label("Accounts", systemImage: "lock.desktopcomputer")
                            case .MacBook:
                                Label("Accounts", systemImage: "lock.laptopcomputer")
                            case .MacDesktop:
                                Label("Accounts", systemImage: "lock.display")
                            case .Vision:
                                Label("Accounts", systemImage: "opticid")
                            case .Unknown:
                                Label("Accounts", systemImage: "lock.ipad")
                            }
                        }
                }
                
                if homeTabViewModel.showNotes {
                    Color.green
                        .badge("2")
                        .tabItem {
                            Label("Notes", systemImage: "note.text")
                        }
                }
                
                if (homeTabViewModel.showCards) {
                    Color.blue
                        .badge("3")
                        .tabItem {
                            Label("Cards", systemImage: "creditcard")
                        }
                }
                
                if (homeTabViewModel.showIdentities) {
                    Color.yellow
                        .badge("4")
                        .tabItem {
                            Label("Identities", systemImage: "person.text.rectangle")
                        }
                }
                
                Color.orange
                    .badge("!")
                    .tabItem {
                        Label("Settings", systemImage: "gear")
                    }
            }
            .toolbarBackground(.blue, for: .tabBar)
            .toolbarBackground(.visible, for: .tabBar)
        }
        .tint(.green)
    }
}

#Preview {
    return HomeTabView(homeTabViewModel: HomeTabViewModel(homeTabViewSettings: HomeTabViewSettings()))
}
