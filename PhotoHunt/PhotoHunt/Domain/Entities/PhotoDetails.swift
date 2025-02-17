//
//  PhotoDetails.swift
//  PhotoHunt
//
//  Created by Quentin Verchère on 05/11/2024.
//

import SwiftUI

public class PhotoDetails {
    init(id: String, createdAt: String, updatedAt: String, width: Int, height: Int, color: String? = nil, blurHash: String? = nil, downloads: Int, likes: Int, likedByUser: Bool, publicDomain: Bool? = nil, description: String? = nil, exif: Exif? = nil, location: Location? = nil, tags: [Tag], currentUserCollections: [UserCollection], urls: PhotoURLs, links: PhotoLinks, user: UserDetails) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.width = width
        self.height = height
        self.color = color
        self.blurHash = blurHash
        self.downloads = downloads
        self.likes = likes
        self.likedByUser = likedByUser
        self.publicDomain = publicDomain
        self.description = description
        self.exif = exif
        self.location = location
        self.tags = tags
        self.currentUserCollections = currentUserCollections
        self.urls = urls
        self.links = links
        self.user = user
    }
    
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
    let exif: Exif?
    let location: Location?
    let tags: [Tag]
    let currentUserCollections: [UserCollection]
    let urls: PhotoURLs
    let links: PhotoLinks
    let user: UserDetails

    static let mocked = PhotoDetails(
        id: "Dwu85P9SOIk",
        createdAt: "2016-05-03T11:00:28-04:00",
        updatedAt: "2016-07-10T11:00:01-05:00",
        width: 2448,
        height: 3264,
        color: "#6E633A",
        blurHash: "LFC$yHwc8^$yIAS$%M%00KxukYIp",
        downloads: 1345,
        likes: 24,
        likedByUser: false,
        publicDomain: false,
        description: "A man drinking a coffee.",
        exif: Exif.mocked,
        location: Location.mocked,
        tags: Tag.mocked,
        currentUserCollections: UserCollection.mocked,
        urls: PhotoURLs.mocked,
        links: PhotoLinks.mocked,
        user: UserDetails.mocked
    )
}
