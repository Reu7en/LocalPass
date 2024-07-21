//
//  SampleIdentities.swift
//  LocalPass
//
//  Created by Reuben on 21/07/2024.
//

import Foundation

struct SampleIdentities {
    static let sampleIdentity1 = Identity(name: "samplename1", title: Title.Mr, firstName: "samplefirstname1", middleName: "samplemiddlename1", lastName: "samplelastname1", birthday: Date(timeIntervalSince1970: 111111111), usernames: [SampleUsernames.sampleUsername1], emails: [SampleEmails.sampleEmail1], phoneNumbers: ["07111111111"], documents: [SampleDocuments.sampleDocument1], addresses: [SampleAddresses.sampleAddress1])
    static let sampleIdentity2 = Identity(name: "samplename2", title: Title.Mrs, firstName: "samplefirstname2", middleName: "samplemiddlename2", lastName: "samplelastname2", birthday: Date(timeIntervalSince1970: 222222222), usernames: [SampleUsernames.sampleUsername2], emails: [SampleEmails.sampleEmail2], phoneNumbers: ["07222222222"], documents: [SampleDocuments.sampleDocument2], addresses: [SampleAddresses.sampleAddress2])
    static let sampleIdentity3 = Identity(name: "samplename3", title: Title.Miss, firstName: "samplefirstname3", middleName: "samplemiddlename3", lastName: "samplelastname3", birthday: Date(timeIntervalSince1970: 333333333), usernames: [SampleUsernames.sampleUsername3], emails: [SampleEmails.sampleEmail3], phoneNumbers: ["07333333333"], documents: [SampleDocuments.sampleDocument3], addresses: [SampleAddresses.sampleAddress3])
    static let sampleIdentity4 = Identity(name: "samplename4", title: Title.Ms, firstName: "samplefirstname4", middleName: "samplemiddlename4", lastName: "samplelastname4", birthday: Date(timeIntervalSince1970: 444444444), usernames: [SampleUsernames.sampleUsername4], emails: [SampleEmails.sampleEmail4], phoneNumbers: ["07444444444"], documents: [SampleDocuments.sampleDocument4], addresses: [SampleAddresses.sampleAddress4])
    static let sampleIdentity5 = Identity(name: "samplename5", title: Title.Other("Mx"), firstName: "samplefirstname5", middleName: "samplemiddlename5", lastName: "samplelastname5", birthday: Date(timeIntervalSince1970: 555555555), usernames: [SampleUsernames.sampleUsername5], emails: [SampleEmails.sampleEmail5], phoneNumbers: ["07555555555"], documents: [SampleDocuments.sampleDocument5], addresses: [SampleAddresses.sampleAddress5])
}
