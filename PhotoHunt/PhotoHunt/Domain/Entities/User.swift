//
//  User.swift
//  PhotoHunt
//
//  Created by Quentin Verchère on 04/11/2024.
//

import Foundation

public class User {
    init(id: String, username: String, name: String, firstName: String? = nil, lastName: String? = nil, profileImage: User.ProfileImage, instagramUsername: String? = nil, totalPhotos: Int? = nil) {
        self.id = id
        self.username = username
        self.name = name
        self.firstName = firstName
        self.lastName = lastName
        self.profileImage = profileImage
        self.instagramUsername = instagramUsername
        self.totalPhotos = totalPhotos
    }
    
    public let id: String
    public let username: String
    public let name: String
    public let firstName: String?
    public let lastName: String?
    public let profileImage: ProfileImage
    public let instagramUsername: String?
    public let totalPhotos: Int?

    public class ProfileImage {
        init(small: URL, medium: URL, large: URL) {
            self.small = small
            self.medium = medium
            self.large = large
        }
        
        public let small: URL
        public let medium: URL
        public let large: URL
    }
    
    public static let mocked = User(
        id: "eySMK9KwmJU",
        username: "samsungmemory",
        name: "Samsung Memory",
        firstName: "Samsung",
        lastName: "Memory",
        profileImage: User.ProfileImage(
            small: URL(string: "https://images.unsplash.com/profile-1602741027167-c4d707fcfc85image?ixlib=rb-4.0.3&crop=faces&fit=crop&w=32&h=32")!,
            medium: URL(string: "https://images.unsplash.com/profile-1602741027167-c4d707fcfc85image?ixlib=rb-4.0.3&crop=faces&fit=crop&w=64&h=64")!,
            large: URL(string: "https://images.unsplash.com/profile-1602741027167-c4d707fcfc85image?ixlib=rb-4.0.3&crop=faces&fit=crop&w=128&h=128")!
        ),
        instagramUsername: "samsungsemiconductor",
        totalPhotos: 880
    )
}
