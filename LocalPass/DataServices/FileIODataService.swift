//
//  FileIODataService.swift
//  LocalPass
//
//  Created by Reuben on 24/07/2024.
//

import Foundation

struct FileIODataService {
    private static let iCloudContainerIdentifier = "iCloud.com.reuben.localpass"
    
    static func save(_ data: Data, to path: URL, with settings: EncryptedFileSettings) -> Bool {
        let filename = settings.useUUIDAsEncryptedFilename.value ? UUID().uuidString : settings.encryptedFilename.value
        let fileURL = path.appendingPathComponent("\(filename).\(settings.encryptedFileExtension.value.rawValue)")
        
        return (try? data.write(to: fileURL)) != nil
    }
    
    static func load(from path: URL) -> Data? {
        return try? Data(contentsOf: path)
    }
    
    static func getPath(for saveLocation: SaveLocation) -> URL? {
        let fileManager = FileManager.default
        
        switch saveLocation {
        case .local:
            return fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
        case .iCloud:
            return fileManager.url(forUbiquityContainerIdentifier: iCloudContainerIdentifier)?.appendingPathComponent("LocalPass")
        }
    }
    
    static func delete(at path: URL) {
        
    }
}
