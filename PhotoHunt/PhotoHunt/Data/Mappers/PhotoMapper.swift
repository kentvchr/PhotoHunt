//
//  PhotoMapper.swift
//  PhotoHunt
//
//  Created by Quentin Verchère on 04/11/2024.
//

struct PhotoMapper {
    /// Maps `UnsplashPhoto` (data layer) to `Photo` (domain layer)
    static func mapToDomain(_ unsplashPhoto: UnsplashPhoto) -> Photo {
        return Photo(
            id: unsplashPhoto.id,
            slug: unsplashPhoto.slug,
            alternativeSlugs: unsplashPhoto.alternativeSlugs,
            createdAt: unsplashPhoto.createdAt,
            updatedAt: unsplashPhoto.updatedAt,
            width: unsplashPhoto.width,
            height: unsplashPhoto.height,
            color: unsplashPhoto.color,
            blurHash: unsplashPhoto.blurHash,
            description: unsplashPhoto.description,
            altDescription: unsplashPhoto.altDescription,
            urls: mapURLsToDomain(unsplashPhoto.urls),
            links: mapLinksToDomain(unsplashPhoto.links),
            likesCount: unsplashPhoto.likesCount,
            likedByUser: unsplashPhoto.likedByUser,
            downloadsCount: unsplashPhoto.downloadsCount,
            viewsCount: unsplashPhoto.viewsCount,
            user: UserMapper.mapToDomain(unsplashPhoto.user),
            sponsorship: unsplashPhoto.sponsorship != nil ? SponsorshipMapper.mapToDomain(unsplashPhoto.sponsorship!) : nil
        )
    }
    
    /// Maps `Photo` (domain layer) to `UnsplashPhoto` (data layer)
    static func mapToData(_ photo: Photo) -> UnsplashPhoto {
        return UnsplashPhoto(
            id: photo.id,
            slug: photo.slug,
            alternativeSlugs: photo.alternativeSlugs,
            createdAt: photo.createdAt,
            updatedAt: photo.updatedAt,
            width: photo.width,
            height: photo.height,
            color: photo.color,
            blurHash: photo.blurHash,
            description: photo.description,
            altDescription: photo.altDescription,
            urls: mapURLsToData(photo.urls),
            links: mapLinksToData(photo.links),
            likesCount: photo.likesCount,
            likedByUser: photo.likedByUser,
            downloadsCount: photo.downloadsCount,
            viewsCount: photo.viewsCount,
            user: UserMapper.mapToData(photo.user),
            sponsorship: photo.sponsorship != nil ? SponsorshipMapper.mapToData(photo.sponsorship!) : nil
        )
    }
    
    static func mapURLsToDomain(_ urls: UnsplashPhoto.URLs) -> Photo.URLs {
        return Photo.URLs(
            raw: urls.raw,
            full: urls.full,
            regular: urls.regular,
            small: urls.small,
            thumb: urls.thumb,
            smallS3: urls.smallS3
        )
    }
    
    static func mapLinksToDomain(_ links: UnsplashPhoto.Links) -> Photo.Links {
        return Photo.Links(
            own: links.own,
            html: links.html,
            download: links.download,
            downloadLocation: links.downloadLocation
        )
    }
    
    //MARK:  Helper functions to map nested types
    static func mapURLsToData(_ urls: Photo.URLs) -> UnsplashPhoto.URLs {
        return UnsplashPhoto.URLs(
            raw: urls.raw,
            full: urls.full,
            regular: urls.regular,
            small: urls.small,
            thumb: urls.thumb,
            smallS3: urls.smallS3
        )
    }
    
    static func mapLinksToData(_ links: Photo.Links) -> UnsplashPhoto.Links {
        return UnsplashPhoto.Links(
            own: links.own,
            html: links.html,
            download: links.download,
            downloadLocation: links.downloadLocation
        )
    }
}
