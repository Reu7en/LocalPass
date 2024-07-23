//
//  CollectionSafeIndexDataService.swift
//  LocalPass
//
//  Created by Reuben on 21/07/2024.
//

import Foundation

extension Collection {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
