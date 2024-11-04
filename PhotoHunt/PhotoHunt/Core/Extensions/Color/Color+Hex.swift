//
//  Color+Hex.swift
//  PhotoHunt
//
//  Created by Quentin Verchère on 04/11/2024.
//

import SwiftUI

extension Color {
    /// Converts a Color to a hexadecimal color code.
    func toHex() -> String? {
        let uiColor = UIColor(self)
        return uiColor.toHex()
    }
    
    init?(hex: String) {
        guard hex.hasPrefix("#") else { return nil }

        let hexColor = String(hex.dropFirst())
        guard let int = Int(hexColor, radix: 16) else { return nil }

        let red = Double((int >> 16) & 0xFF) / 255.0
        let green = Double((int >> 8) & 0xFF) / 255.0
        let blue = Double(int & 0xFF) / 255.0

        self = Color(red: red, green: green, blue: blue)
    }
}
