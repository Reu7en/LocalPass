//
//  SampleAccounts.swift
//  LocalPass
//
//  Created by Reuben on 21/07/2024.
//

import Foundation

struct SampleAccounts {
    static let sampleAccount1 = Account(name: "sampleaccount1", logins: [SampleLogins.sampleLogin1], showInAutofill: true)
    static let sampleAccount2 = Account(name: "sampleaccount2", logins: [SampleLogins.sampleLogin2], showInAutofill: true)
    static let sampleAccount3 = Account(name: "sampleaccount3", logins: [SampleLogins.sampleLogin3], showInAutofill: true)
    static let sampleAccount4 = Account(name: "sampleaccount4", logins: [SampleLogins.sampleLogin4], showInAutofill: true)
    static let sampleAccount5 = Account(name: "sampleaccount5", logins: [SampleLogins.sampleLogin5], showInAutofill: true)
}
