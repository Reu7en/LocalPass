//
//  FolderContentType.swift
//  LocalPass
//
//  Created by Reuben on 13/07/2024.
//

import Foundation

enum FolderContentType<T: FolderContent>: Codable, Equatable {
    case item(T)
    case folder(Folder<T>)
    
    private enum CodingKeys: String, CodingKey {
        case item, folder
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        switch self {
        case .item(let value):
            try container.encode(value, forKey: .item)
        case .folder(let value):
            try container.encode(value, forKey: .folder)
        }
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        if let value = try? container.decode(T.self, forKey: .item) {
            self = .item(value)
            return
        }
        
        if let value = try? container.decode(Folder<T>.self, forKey: .folder) {
            self = .folder(value)
            return
        }
        
        throw DecodingError.dataCorruptedError(forKey: .item, in: container, debugDescription: "Unable to decode FolderContentType")
    }
    
    static func == (lhs: FolderContentType<T>, rhs: FolderContentType<T>) -> Bool {
        switch (lhs, rhs) {
        case (.item(let lhsItem), .item(let rhsItem)):
            return lhsItem == rhsItem
        case (.folder(let lhsFolder), .folder(let rhsFolder)):
            return lhsFolder == rhsFolder
        default:
            return false
        }
    }
}
