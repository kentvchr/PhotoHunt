//
//  UnsplashUserCollection.swift
//  PhotoHunt
//
//  Created by Quentin Verchère on 05/11/2024.
//

public struct UnsplashUserCollection: Codable {
    let id: Int
    let title: String
    let publishedAt: String
    let lastCollectedAt: String
    let updatedAt: String
    let coverPhoto: String?
    let user: String?
    
    private enum CodingKeys: String, CodingKey {
        case id, title, publishedAt = "published_at"
        case lastCollectedAt = "last_collected_at", updatedAt = "updated_at"
        case coverPhoto = "cover_photo", user
    }
}
