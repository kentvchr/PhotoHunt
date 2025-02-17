//
//  UserDetails.swift
//  PhotoHunt
//
//  Created by Quentin Verchère on 05/11/2024.
//

public class UserDetails {
    init(id: String, updatedAt: String, username: String, name: String, portfolioURL: String? = nil, bio: String? = nil, location: String? = nil, totalLikes: Int, totalPhotos: Int, totalCollections: Int, links: UserLinks) {
        self.id = id
        self.updatedAt = updatedAt
        self.username = username
        self.name = name
        self.portfolioURL = portfolioURL
        self.bio = bio
        self.location = location
        self.totalLikes = totalLikes
        self.totalPhotos = totalPhotos
        self.totalCollections = totalCollections
        self.links = links
    }
    
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
    let links: UserLinks
    
    static let mocked = UserDetails(
        id: "QPxL2MGqfrw",
        updatedAt: "2016-07-10T11:00:01-05:00",
        username: "exampleuser",
        name: "Joe Example",
        portfolioURL: "https://example.com/",
        bio: "Just an everyday Joe",
        location: "Montreal",
        totalLikes: 5,
        totalPhotos: 10,
        totalCollections: 13,
        links: UserLinks.mocked
    )
}
