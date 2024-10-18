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
            Image(systemName: "key.horizontal.fill")
            
            Text("Encrypted User Data:\n")
            
            Text("Bin:\n")
            
            Text("\(String(describing: SampleEncryptedUserData.sampleEncryptedUserData.bin))\n")
            
            Text("Salt:\n")
            
            Text("\(String(describing: SampleEncryptedUserData.sampleEncryptedUserData.keyMetaData.salt))\n")
            
            Text("Iterations:\n")
            
            Text("\(String(describing: SampleEncryptedUserData.sampleEncryptedUserData.keyMetaData.iterations))\n")
            
            Text("Key Derivation Algorithm:\n")
            
            Text("\(String(describing: SampleEncryptedUserData.sampleEncryptedUserData.keyMetaData.keyDerivationAlgorithm))\n")
            
            Text("Encryption Algorithm:\n")
            
            Text("\(String(describing: SampleEncryptedUserData.sampleEncryptedUserData.encryptionMetaData.encryptionAlgorithm))\n")
            
            Text("Round:\n")
            
            Text("\(String(describing: SampleEncryptedUserData.sampleEncryptedUserData.encryptionMetaData.round))\n")
            
            Text("ID:\n")
            
            Text("\(String(describing: SampleEncryptedUserData.sampleEncryptedUserData.id))\n")
            
            Text("Sample User Data:\n")
            
            Text("Accounts:\n")
            
            ForEach(0..<(SampleUserData.data.accounts?.contents ?? []).count, id: \.self) { accountIndex in
                Text("\(String(describing: SampleUserData.data.accounts?.contents?[accountIndex]))\n")
            }
            
            Text("Notes:\n")
            
            ForEach(0..<(SampleUserData.data.notes?.contents ?? []).count, id: \.self) { noteIndex in
                Text("\(String(describing: SampleUserData.data.notes?.contents?[noteIndex]))\n")
            }
            
            Text("Cards:\n")
            
            ForEach(0..<(SampleUserData.data.cards?.contents ?? []).count, id: \.self) { cardIndex in
                Text("\(String(describing: SampleUserData.data.cards?.contents?[cardIndex]))\n")
            }
            
            Text("Identities:\n")
            
            ForEach(0..<(SampleUserData.data.identities?.contents ?? []).count, id: \.self) { identityIndex in
                Text("\(String(describing: SampleUserData.data.identities?.contents?[identityIndex]))\n")
            }
            
            Text("User Settings:\n")
            
            Text("\(String(describing: SampleUserData.data.userSettings))\n")
            
            Text("ID:\n")
            
            Text("\(String(describing: SampleUserData.data.id))\n")
        }
    }
}

#Preview {
    RootView()
}
