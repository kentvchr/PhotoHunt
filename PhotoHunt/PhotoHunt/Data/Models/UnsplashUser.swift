//
//  UnsplashUser.swift
//  PhotoHunt
//
//  Created by Quentin Verchère on 04/11/2024.
//

import Foundation

public struct UnsplashUser: Codable {
    public let id: String
    public let username: String
    public let name: String
    public let firstName: String?
    public let lastName: String?
    public let profileImage: ProfileImage
    public let instagramUsername: String?
    public let totalPhotos: Int?

    private enum CodingKeys: String, CodingKey {
        case id, username, name, firstName = "first_name", lastName = "last_name"
        case profileImage = "profile_image"
        case instagramUsername = "instagram_username"
        case totalPhotos = "total_photos"
    }
    
    public init(id: String, username: String, name: String, firstName: String? = nil, lastName: String? = nil, profileImage: UnsplashUser.ProfileImage, instagramUsername: String? = nil, totalPhotos: Int? = nil) {
        self.id = id
        self.username = username
        self.name = name
        self.firstName = firstName
        self.lastName = lastName
        self.profileImage = profileImage
        self.instagramUsername = instagramUsername
        self.totalPhotos = totalPhotos
    }

    public struct ProfileImage: Codable {
        public let small: URL
        public let medium: URL
        public let large: URL
        
        public init(small: URL, medium: URL, large: URL) {
            self.small = small
            self.medium = medium
            self.large = large
        }
    }
}
