//
//  URLValidatorDataService.swift
//  LocalPass
//
//  Created by Reuben on 21/07/2024.
//

import Foundation

struct URLValidatorDataService {
    static func validate(urlString: String) -> URL? {
        guard !urlString.isEmpty else { return nil }
        guard let url = URL(string: urlString) else { return nil }
        guard let scheme = url.scheme?.lowercased(), ["http", "https"].contains(scheme) else { return nil }
        
        return url  
    }
}
