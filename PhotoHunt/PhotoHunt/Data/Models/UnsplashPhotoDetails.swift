//
//  UnsplashPhotoDetails.swift
//  PhotoHunt
//
//  Created by Quentin Verchère on 05/11/2024.
//

import Foundation

struct UnsplashPhotoDetails: Codable {
    let id: String
    let createdAt: String
    let updatedAt: String
    let width: Int
    let height: Int
    let color: String?
    let blurHash: String?
    let downloads: Int
    let likes: Int
    let likedByUser: Bool
    let publicDomain: Bool?
    let description: String?
    let exif: UnsplashExif?
    let location: UnsplashLocation?
    let tags: [UnsplashTag]
    let currentUserCollections: [UnsplashUserCollection]
    let urls: UnsplashPhotoURLs
    let links: UnsplashPhotoLinks
    let user: UnsplashUserDetails
    
    private enum CodingKeys: String, CodingKey {
        case id
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case width, height, color, blurHash = "blur_hash"
        case downloads, likes, likedByUser = "liked_by_user"
        case publicDomain = "public_domain"
        case description, exif, location, tags
        case currentUserCollections = "current_user_collections"
        case urls, links, user
    }
}
