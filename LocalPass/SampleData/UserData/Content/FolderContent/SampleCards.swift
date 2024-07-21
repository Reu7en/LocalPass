//
//  SampleCards.swift
//  LocalPass
//
//  Created by Reuben on 21/07/2024.
//

import Foundation

struct SampleCards {
    static let sampleCard1 = Card(name: "samplecard1", holder: "sampleholder1", number: 1111111111111111, expirationMonth: 01, expirationYear: 2001, securityCode: 111, notes: ["samplenote1"], showInAutofill: true)
    static let sampleCard2 = Card(name: "samplecard2", holder: "sampleholder2", number: 2222222222222222, expirationMonth: 02, expirationYear: 2002, securityCode: 222, notes: ["samplenote2"], showInAutofill: true)
    static let sampleCard3 = Card(name: "samplecard3", holder: "sampleholder3", number: 3333333333333333, expirationMonth: 03, expirationYear: 2003, securityCode: 333, notes: ["samplenote3"], showInAutofill: true)
    static let sampleCard4 = Card(name: "samplecard4", holder: "sampleholder4", number: 4444444444444444, expirationMonth: 04, expirationYear: 2004, securityCode: 444, notes: ["samplenote4"], showInAutofill: true)
    static let sampleCard5 = Card(name: "samplecard5", holder: "sampleholder5", number: 5555555555555555, expirationMonth: 05, expirationYear: 2005, securityCode: 555, notes: ["samplenote5"], showInAutofill: true)
}
