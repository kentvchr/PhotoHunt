//
//  String+ISO8601.swift
//  PhotoHunt
//
//  Created by Quentin Verchère on 05/11/2024.
//

import Foundation

extension String {
    /// Converts an ISO 8601 date string to a readable date format.
    func iso8601() -> String? {
        guard let date = DateFormatter.iso8601Full.date(from: self) else { return nil }
        return DateFormatter.displayFormat.string(from: date)
    }
}
