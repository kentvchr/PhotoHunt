//
//  UnsplashPhotoURLs.swift
//  PhotoHunt
//
//  Created by Quentin Verchère on 05/11/2024.
//

import Foundation

public struct UnsplashPhotoURLs: Codable {
    public let raw: URL
    public let full: URL
    public let regular: URL
    public let small: URL
    public let thumb: URL
    public let smallS3: URL
    
    private enum CodingKeys: String, CodingKey {
        case raw, full, regular, small, thumb, smallS3 = "small_s3"
    }
    
    public init(raw: URL, full: URL, regular: URL, small: URL, thumb: URL, smallS3: URL) {
        self.raw = raw
        self.full = full
        self.regular = regular
        self.small = small
        self.thumb = thumb
        self.smallS3 = smallS3
    }
}
