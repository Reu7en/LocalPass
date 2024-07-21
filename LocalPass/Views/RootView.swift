//
//  RootView.swift
//  LocalPass
//
//  Created by Reuben on 20/06/2024.
//

import SwiftUI

struct RootView: View {
    var body: some View {
        ScrollView {
            Text("Sample User Data\n")
            
            Text("Accounts\n")
            
            ForEach(0..<(SampleUserData.sampleUserData.accounts?.contents ?? []).count, id: \.self) { accountIndex in
                Text("\(String(describing: SampleUserData.sampleUserData.accounts?.contents?[accountIndex]))\n")
            }
            
            Text("Notes\n")
            
            ForEach(0..<(SampleUserData.sampleUserData.notes?.contents ?? []).count, id: \.self) { noteIndex in
                Text("\(String(describing: SampleUserData.sampleUserData.notes?.contents?[noteIndex]))\n")
            }
            
            Text("Cards\n")
            
            ForEach(0..<(SampleUserData.sampleUserData.cards?.contents ?? []).count, id: \.self) { cardIndex in
                Text("\(String(describing: SampleUserData.sampleUserData.cards?.contents?[cardIndex]))\n")
            }
            
            Text("Identities\n")
            
            ForEach(0..<(SampleUserData.sampleUserData.identities?.contents ?? []).count, id: \.self) { identityIndex in
                Text("\(String(describing: SampleUserData.sampleUserData.identities?.contents?[identityIndex]))\n")
            }
        }
    }
}

#Preview {
    RootView()
}
