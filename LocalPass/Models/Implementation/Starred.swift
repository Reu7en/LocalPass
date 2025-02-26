//
//  Starred.swift
//  LocalPass
//
//  Created by Reuben on 26/02/2025.
//

import Foundation

struct Starred: AttributeBase {
    let value: Bool
    
    init(_ value: Bool = false) {
        self.value = value
    }
    
    func validate() {}
}
