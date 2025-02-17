//
//  UIColor+Hex.swift
//  PhotoHunt
//
//  Created by Quentin Verchère on 04/11/2024.
//

import SwiftUI

extension UIColor {
    /// Converts UIColor to hexadecimal color code in the format `#RRGGBB`.
    func toHex() -> String? {
        guard let components = cgColor.components, components.count >= 3 else {
            return nil
        }

        let red = Float(components[0])
        let green = Float(components[1])
        let blue = Float(components[2])

        let hexString = String(
            format: "#%02lX%02lX%02lX",
            lroundf(red * 255),
            lroundf(green * 255),
            lroundf(blue * 255)
        )
        
        return hexString
    }
}
