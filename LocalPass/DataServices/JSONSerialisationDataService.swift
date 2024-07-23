//
//  JSONSerialisationDataService.swift
//  LocalPass
//
//  Created by Reuben on 22/07/2024.
//

import Foundation

struct JSONSerialisationDataService {
    static func userDataToJSON(_ userData: UserData) -> Data? {
        return try? JSONEncoder().encode(userData)
    }
    
    static func JSONToUserData(_ JSONData: Data) -> UserData? {
        return try? JSONDecoder().decode(UserData.self, from: JSONData)
    }
}
