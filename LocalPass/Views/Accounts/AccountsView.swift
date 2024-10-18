//
//  AccountsView.swift
//  LocalPass
//
//  Created by Reuben on 30/09/2024.
//

import SwiftUI

struct AccountsView: View {
    @ObservedObject var viewModel: AccountsViewModel
    
    var body: some View {
        ZStack {
            viewModel.backgroundColor.ignoresSafeArea()
            
            VStack {
                Text("Foo")
            }
        }
    }
}

#Preview {
    AccountsView(
        viewModel: AccountsViewModel(
            accounts: SampleUserData.data.accounts,
            theme: Theme.defaultTheme
        )
    )
}
