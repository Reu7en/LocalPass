//
//  AccountsViewModel.swift
//  LocalPass
//
//  Created by Reuben on 01/10/2024.
//

import Foundation
import SwiftUI

class AccountsViewModel: ObservableObject {
    // View properties
    @Published private(set) var accounts: Folder<Account>?
    @Published private(set) var backgroundColor: Color
    
    // Child view properties
    let theme: Theme
    
    var hasAnyAccounts: Bool {
        self.calculateHasAnyAccounts()
    }
    
    // Child view properties
    
    init(
        accounts: Folder<Account>?,
        theme: Theme
    ) {
        self.accounts = accounts
        self.backgroundColor = theme.backgroundColor.color
        
        self.theme = theme
    }
    
    private func calculateHasAnyAccounts() -> Bool {
        return accounts != nil && accounts?.contents != nil && !(accounts?.contents?.isEmpty ?? true)
    }
}
