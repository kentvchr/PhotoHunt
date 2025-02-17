//
//  UnsplashSponsorship.swift
//  PhotoHunt
//
//  Created by Quentin Verchère on 04/11/2024.
//


public struct UnsplashSponsorship: Codable {
    public let tagline: String
    public let sponsor: UnsplashUser

    private enum CodingKeys: String, CodingKey {
        case tagline, sponsor
    }
    
    public init(tagline: String, sponsor: UnsplashUser) {
        self.tagline = tagline
        self.sponsor = sponsor
    }
}
