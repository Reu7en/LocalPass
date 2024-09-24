//
//  DeviceInformationDataService.swift
//  LocalPass
//
//  Created by Reuben on 22/09/2024.
//

import Foundation
import UIKit
import DeviceCheck

struct DeviceInformationDataService {
    static func getDeviceType() -> DeviceType {
        let currentDevice = UIDevice.current
        
        switch currentDevice.userInterfaceIdiom {
        case .phone:
            return .iPhone
        case .pad:
            return .iPad
        case .mac:
            return getMacDeviceType()
        case .vision:
            return .Vision
        default:
            return .Unknown
        }
    }
    
    private static func getMacDeviceType() -> DeviceType {
        guard let modelIdentifier = getModelIdentifier() else { return .Unknown }
        
        if modelIdentifier.contains("iMac") {
            return .iMac
        } else if modelIdentifier.contains("MacBook") {
            return .MacBook
        } else {
            return .MacDesktop
        }
    }
    
    private static func getModelIdentifier() -> String? {
        var systemInfo = utsname()
        uname(&systemInfo)
        
        let modelIdentifier = withUnsafePointer(to: &systemInfo.machine) { ptr in
            return String(cString: ptr.withMemoryRebound(to: CChar.self, capacity: 1) { $0 })
        }
        
        return modelIdentifier
    }
}

enum DeviceType: CaseIterable, Equatable, Codable {
    case iPhone
    case iPad
    case iMac
    case MacBook
    case MacDesktop
    case Vision
    case Unknown
}
