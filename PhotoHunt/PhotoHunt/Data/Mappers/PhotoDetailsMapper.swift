//
//  PhotoDetailsMapper.swift
//  PhotoHunt
//
//  Created by Quentin Verchère on 05/11/2024.
//

struct PhotoDetailsMapper {
    /// Maps `UnsplashPhotoDetails` (data layer) to `PhotoDetails` (domain layer)
    static func mapToDomain(_ details: UnsplashPhotoDetails) -> PhotoDetails {
        let urls = PhotoURLs(
            raw: details.urls.raw,
            full: details.urls.full,
            regular: details.urls.regular,
            small: details.urls.small,
            thumb: details.urls.thumb,
            smallS3: details.urls.smallS3
        )
        
        let links = PhotoLinks(
            own: details.links.own,
            html: details.links.html,
            download: details.links.download,
            downloadLocation: details.links.downloadLocation
        )
        
        let exif = details.exif.map {
            Exif(
                make: $0.make,
                model: $0.model,
                name: $0.name,
                exposureTime: $0.exposureTime,
                aperture: $0.aperture,
                focalLength: $0.focalLength,
                iso: $0.iso
            )
        }
        
        let location = details.location.map {
            Location(
                city: $0.city,
                country: $0.country,
                position: $0.position.map {
                    Location.Position(
                        latitude: $0.latitude,
                        longitude: $0.longitude
                    )
                }
            )
        }
        
        let tags = details.tags.map { Tag(title: $0.title) }
        
        let currentUserCollections = details.currentUserCollections.map {
            UserCollection(
                id: $0.id,
                title: $0.title,
                publishedAt: $0.publishedAt,
                lastCollectedAt: $0.lastCollectedAt,
                updatedAt: $0.updatedAt,
                coverPhoto: $0.coverPhoto,
                user: $0.user
            )
        }
        
        // Map User Details
        let userLinks = UserLinks(
            own: details.user.links.own,
            html: details.user.links.html,
            photos: details.user.links.photos,
            likes: details.user.links.likes,
            portfolio: details.user.links.portfolio
        )
        
        let userDetails = UserDetails(
            id: details.user.id,
            updatedAt: details.user.updatedAt,
            username: details.user.username,
            name: details.user.name,
            portfolioURL: details.user.portfolioURL,
            bio: details.user.bio,
            location: details.user.location,
            totalLikes: details.user.totalLikes,
            totalPhotos: details.user.totalPhotos,
            totalCollections: details.user.totalCollections,
            links: userLinks
        )
        
        // Map to PhotoDetails
        return PhotoDetails(
            id: details.id,
            createdAt: details.createdAt,
            updatedAt: details.updatedAt,
            width: details.width,
            height: details.height,
            color: details.color,
            blurHash: details.blurHash,
            downloads: details.downloads,
            likes: details.likes,
            likedByUser: details.likedByUser,
            publicDomain: details.publicDomain,
            description: details.description,
            exif: exif,
            location: location,
            tags: tags,
            currentUserCollections: currentUserCollections,
            urls: urls,
            links: links,
            user: userDetails
        )
    }
    
    /// Maps `PhotoDetails` (domain layer) to `UnsplashPhotoDetails` (data layer)
    static func mapToData(_ details: PhotoDetails) -> UnsplashPhotoDetails {
        let urls = UnsplashPhotoURLs(
            raw: details.urls.raw,
            full: details.urls.full,
            regular: details.urls.regular,
            small: details.urls.small,
            thumb: details.urls.thumb,
            smallS3: details.urls.smallS3
        )
        
        let links = UnsplashPhotoLinks(
            own: details.links.own,
            html: details.links.html,
            download: details.links.download,
            downloadLocation: details.links.downloadLocation
        )
        
        let exif = details.exif.map {
            UnsplashExif(
                make: $0.make,
                model: $0.model,
                name: $0.name,
                exposureTime: $0.exposureTime,
                aperture: $0.aperture,
                focalLength: $0.focalLength,
                iso: $0.iso
            )
        }
        
        let location = details.location.map {
            UnsplashLocation(
                city: $0.city,
                country: $0.country,
                position: $0.position.map {
                    UnsplashLocation.Position(
                        latitude: $0.latitude,
                        longitude: $0.longitude
                    )
                }
            )
        }
        
        let tags = details.tags.map { UnsplashTag(title: $0.title) }
        
        let currentUserCollections = details.currentUserCollections.map {
            UnsplashUserCollection(
                id: $0.id,
                title: $0.title,
                publishedAt: $0.publishedAt,
                lastCollectedAt: $0.lastCollectedAt,
                updatedAt: $0.updatedAt,
                coverPhoto: $0.coverPhoto,
                user: $0.user
            )
        }
        
        let userLinks = UnsplashUserLinks(
            own: details.user.links.own,
            html: details.user.links.html,
            photos: details.user.links.photos,
            likes: details.user.links.likes,
            portfolio: details.user.links.portfolio
        )
        
        let userDetails = UnsplashUserDetails(
            id: details.user.id,
            updatedAt: details.user.updatedAt,
            username: details.user.username,
            name: details.user.name,
            portfolioURL: details.user.portfolioURL,
            bio: details.user.bio,
            location: details.user.location,
            totalLikes: details.user.totalLikes,
            totalPhotos: details.user.totalPhotos,
            totalCollections: details.user.totalCollections,
            links: userLinks
        )
        
        return UnsplashPhotoDetails(
            id: details.id,
            createdAt: details.createdAt,
            updatedAt: details.updatedAt,
            width: details.width,
            height: details.height,
            color: details.color,
            blurHash: details.blurHash,
            downloads: details.downloads,
            likes: details.likes,
            likedByUser: details.likedByUser,
            publicDomain: details.publicDomain,
            description: details.description,
            exif: exif,
            location: location,
            tags: tags,
            currentUserCollections: currentUserCollections,
            urls: urls,
            links: links,
            user: userDetails
        )
    }
    
}
