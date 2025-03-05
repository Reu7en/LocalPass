//
//  CharacterExtensions.swift
//  LocalPass
//
//  Created by Reuben on 27/02/2025.
//

import Foundation

extension Character {
    static let base32PaddingCharacter: Character = "="
    
    private static let base32CharacterSet: Set<Character> =
    [
        "A",
        "B",
        "C",
        "D",
        "E",
        "F",
        "G",
        "H",
        "I",
        "J",
        "K",
        "L",
        "M",
        "N",
        "O",
        "P",
        "Q",
        "R",
        "S",
        "T",
        "U",
        "V",
        "W",
        "X",
        "Y",
        "Z",
        "2",
        "3",
        "4",
        "5",
        "6",
        "7"
    ]
    
    var isBase32: Bool {
        return self == Character.base32PaddingCharacter || Character.base32CharacterSet.contains(self.uppercased())
    }
}
