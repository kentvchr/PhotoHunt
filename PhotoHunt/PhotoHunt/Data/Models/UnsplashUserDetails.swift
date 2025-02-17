//
//  UnsplashUserDetails.swift
//  PhotoHunt
//
//  Created by Quentin Verchère on 05/11/2024.
//

public struct UnsplashUserDetails: Codable {
    let id: String
    let updatedAt: String
    let username: String
    let name: String
    let portfolioURL: String?
    let bio: String?
    let location: String?
    let totalLikes: Int
    let totalPhotos: Int
    let totalCollections: Int
    let links: UnsplashUserLinks
    
    private enum CodingKeys: String, CodingKey {
        case id, updatedAt = "updated_at"
        case username, name, portfolioURL = "portfolio_url"
        case bio, location, totalLikes = "total_likes"
        case totalPhotos = "total_photos", totalCollections = "total_collections"
        case links
    }
}
