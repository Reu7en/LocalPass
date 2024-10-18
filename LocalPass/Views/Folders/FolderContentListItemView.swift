//
//  FolderContentListItemView.swift
//  LocalPass
//
//  Created by Reuben on 13/10/2024.
//

import SwiftUI

struct FolderContentListItemView<T: FolderContent>: View {
    @ObservedObject var viewModel: FolderContentListItemViewModel<T>
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                .foregroundStyle(viewModel.primaryColor)
            
            HStack {
                Image(systemName: "gear")
                
                Spacer()
                
                Text(String(describing: viewModel.label))
            }
        }
        
        VStack {
            Text(String(describing: viewModel.label))
            Text(String(describing: viewModel.starred))
            Text(String(describing: viewModel.contentType))
        }
    }
}

#Preview {
    FolderContentListItemView(
        viewModel: FolderContentListItemViewModel(
            folderContent: FolderContentType.item(SampleAccounts.sampleAccount1),
            theme: Theme.defaultTheme
        )
    )
}
