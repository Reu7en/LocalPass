//
//  SampleLogins.swift
//  LocalPass
//
//  Created by Reuben on 21/07/2024.
//

import Foundation

struct SampleLogins {
    static let sampleLogin1 = Login(name: "samplelogin1", username: SampleUsernames.sampleUsername1, password: "samplepassword1", urlStrings: ["sampleurl1"], totpKey: "sampletotpkey1", backupCodes: ["samplebackupcode1"], notes: ["samplenote1"], showInAutofill: true)
    static let sampleLogin2 = Login(name: "samplelogin2", username: SampleUsernames.sampleUsername2, password: "samplepassword2", urlStrings: ["sampleurl2"], totpKey: "sampletotpkey2", backupCodes: ["samplebackupcode2"], notes: ["samplenote2"], showInAutofill: true)
    static let sampleLogin3 = Login(name: "samplelogin3", username: SampleUsernames.sampleUsername3, password: "samplepassword3", urlStrings: ["sampleurl3"], totpKey: "sampletotpkey3", backupCodes: ["samplebackupcode3"], notes: ["samplenote3"], showInAutofill: true)
    static let sampleLogin4 = Login(name: "samplelogin4", username: SampleUsernames.sampleUsername4, password: "samplepassword4", urlStrings: ["sampleurl4"], totpKey: "sampletotpkey4", backupCodes: ["samplebackupcode4"], notes: ["samplenote4"], showInAutofill: true)
    static let sampleLogin5 = Login(name: "samplelogin5", username: SampleUsernames.sampleUsername5, password: "samplepassword5", urlStrings: ["sampleurl5"], totpKey: "sampletotpkey5", backupCodes: ["samplebackupcode5"], notes: ["samplenote5"], showInAutofill: true)
}
