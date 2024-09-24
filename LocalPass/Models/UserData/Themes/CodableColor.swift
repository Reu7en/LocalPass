//
//  CodableColor.swift
//  LocalPass
//
//  Created by Reuben on 24/09/2024.
//

import Foundation
import SwiftUI

struct CodableColor: Equatable, Codable {
    private let red: Double
    private let green: Double
    private let blue: Double
    private let opacity: Double
    
    var color: Color {
        Color(red: self.red, green: self.green, blue: self.blue, opacity: self.opacity)
    }
    
    init(
        color: Color
    ) {
        let uiColor = UIColor(color)
        
        var red: CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat = 0.0
        var alpha: CGFloat = 0.0
        
        uiColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        self.red = Double(red)
        self.green = Double(green)
        self.blue = Double(blue)
        self.opacity = Double(alpha)
    }
}
