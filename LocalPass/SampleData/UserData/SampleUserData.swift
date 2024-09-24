//
//  SampleUserData.swift
//  LocalPass
//
//  Created by Reuben on 21/07/2024.
//

import Foundation

struct SampleUserData {
    static var sampleUserData: UserData {
        var userData = UserData()
        
        userData.accounts = Folder(
            name: "sampleaccountsroot",
            contents: [
                .item(SampleAccounts.sampleAccount1),
                .item(SampleAccounts.sampleAccount2),
                .item(SampleAccounts.sampleAccount3),
                .item(SampleAccounts.sampleAccount4),
                .item(SampleAccounts.sampleAccount5)
            ]
        )
        
        userData.notes = Folder(
            name: "samplenotesroot",
            contents: [
                .item(SampleNotes.sampleNote1),
                .item(SampleNotes.sampleNote2),
                .item(SampleNotes.sampleNote3),
                .item(SampleNotes.sampleNote4),
                .item(SampleNotes.sampleNote5)
            ]
        )
        
        userData.cards = Folder(
            name: "samplecardsroot",
            contents: [
                .item(SampleCards.sampleCard1),
                .item(SampleCards.sampleCard2),
                .item(SampleCards.sampleCard3),
                .item(SampleCards.sampleCard4),
                .item(SampleCards.sampleCard5)
            ]
        )
        
        userData.identities = Folder(
            name: "sampleidentitiesroot",
            contents: [
                .item(SampleIdentities.sampleIdentity1),
                .item(SampleIdentities.sampleIdentity2),
                .item(SampleIdentities.sampleIdentity3),
                .item(SampleIdentities.sampleIdentity4),
                .item(SampleIdentities.sampleIdentity5)
            ]
        )
        
        return userData
    }
}
