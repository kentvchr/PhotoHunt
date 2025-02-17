//
//  UserMapper.swift
//  PhotoHunt
//
//  Created by Quentin Verchère on 04/11/2024.
//

struct UserMapper {
    /// Maps `UnsplashUser` (data layer) to `User` (domain layer)
    static func mapToDomain(_ user: UnsplashUser) -> User {
        return User(
            id: user.id,
            username: user.username,
            name: user.name,
            firstName: user.firstName,
            lastName: user.lastName,
            profileImage: mapProfileImageToDomain(user.profileImage),
            instagramUsername: user.instagramUsername,
            totalPhotos: user.totalPhotos
        )
    }
    
    /// Maps `User` (domain layer) to `UnsplashUser` (data layer)
    static func mapToData(_ user: User) -> UnsplashUser {
        return UnsplashUser(
            id: user.id,
            username: user.username,
            name: user.name,
            firstName: user.firstName,
            lastName: user.lastName,
            profileImage: mapProfileImageToData(user.profileImage),
            instagramUsername: user.instagramUsername,
            totalPhotos: user.totalPhotos
        )
    }
    
    // MARK: Helper functions to map nested types
    
    static func mapProfileImageToDomain(_ profileImage: UnsplashUser.ProfileImage) -> User.ProfileImage {
        return User.ProfileImage(small: profileImage.small, medium: profileImage.medium, large: profileImage.large)
    }
    
    static func mapProfileImageToData(_ profileImage: User.ProfileImage) -> UnsplashUser.ProfileImage {
        return UnsplashUser.ProfileImage(small: profileImage.small, medium: profileImage.medium, large: profileImage.large)
    }
}
