//
//  DateFormatter+ISO8601.swift
//  PhotoHunt
//
//  Created by Quentin Verchère on 05/11/2024.
//

import Foundation

extension DateFormatter {
    /// A date formatter for ISO 8601 dates with a "Z" timezone (UTC).
    static let iso8601Full: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter
    }()
    
    static let displayFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        formatter.timeStyle = .none
        return formatter
    }()
}
