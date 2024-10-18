//
//  FolderContentListItemViewModel.swift
//  LocalPass
//
//  Created by Reuben on 13/10/2024.
//

import Foundation
import SwiftUI

class FolderContentListItemViewModel<T: FolderContent>: ObservableObject {
    @Published private(set) var starred: Bool
    @Published private(set) var contentType: any FolderContent.Type
    @Published private(set) var primaryColor: Color
    @Published private(set) var textColor: Color
    
    private var name: String?
    
    var label: String {
        if let name = self.name, !name.isEmpty {
            return name
        } else {
            switch contentType {
            case is Account.Type:
                return "An Account"
            case is Note.Type:
                return "A Note"
            case is Card.Type:
                return "A Card"
            case is Identity.Type:
                return "An Identity"
            case is Folder<T>.Type:
                return "A Folder"
            default:
                return "Something"
            }
        }
    }
    
    init(
        folderContent: FolderContentType<T>,
        theme: Theme
    ) {
        self.name = folderContent.content.name
        self.starred = folderContent.content.starred
        self.contentType = type(of: folderContent.content)
        self.primaryColor = theme.primaryColor.color
        self.textColor = theme.textColor.color
    }
}
