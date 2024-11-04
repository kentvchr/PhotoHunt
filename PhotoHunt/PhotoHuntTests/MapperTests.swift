//
//  MapperTests.swift
//  PhotoHunt
//
//  Created by Quentin Verchère on 04/11/2024.
//

import XCTest
import SwiftUI
@testable import PhotoHunt

final class PhotoMapperTests: XCTestCase {
    func testMapUnsplashPhotoToDomain() {
        // Arrange: Create mock UnsplashPhoto data
        let mockUnsplashPhoto = UnsplashPhoto(
            id: "QpLJ8Kw5S0Q",
            slug: "a-person-sitting-on-a-rock-with-a-camera-QpLJ8Kw5S0Q",
            alternativeSlugs: ["en": "a-person-sitting-on-a-rock-with-a-camera-QpLJ8Kw5S0Q"],
            createdAt: "2024-07-02T16:21:05Z",
            updatedAt: "2024-10-01T18:27:58Z",
            width: 3600,
            height: 2700,
            color: Color(hex: "#737373"),
            blurHash: "LSFYGiIUxvM{0K-;Mxog-:IUtRt6",
            description: "A beautiful photo of nature",
            altDescription: "A person sitting on a rock with a camera",
            urls: UnsplashPhoto.URLs(
                raw: URL(string: "https://example.com/raw.jpg")!,
                full: URL(string: "https://example.com/full.jpg")!,
                regular: URL(string: "https://example.com/regular.jpg")!,
                small: URL(string: "https://example.com/small.jpg")!,
                thumb: URL(string: "https://example.com/thumb.jpg")!,
                smallS3: URL(string: "https://example.com/smallS3.jpg")!
            ),
            links: UnsplashPhoto.Links(
                own: URL(string: "https://example.com/own")!,
                html: URL(string: "https://example.com/html")!,
                download: URL(string: "https://example.com/download")!,
                downloadLocation: URL(string: "https://example.com/download_location")!
            ),
            likesCount: 100,
            likedByUser: true,
            downloadsCount: 500,
            viewsCount: 2000,
            user: UnsplashUser(
                id: "eySMK9KwmJU",
                username: "sample_user",
                name: "Sample User",
                firstName: "Sample",
                lastName: "User",
                profileImage: UnsplashUser.ProfileImage(
                    small: URL(string: "https://example.com/small.jpg")!,
                    medium: URL(string: "https://example.com/medium.jpg")!,
                    large: URL(string: "https://example.com/large.jpg")!
                ),
                instagramUsername: "sample_insta",
                totalPhotos: 10
            ),
            sponsorship: UnsplashSponsorship(
                tagline: "Sponsored by Sample",
                sponsor: UnsplashUser(
                    id: "sponsor_id",
                    username: "sponsor_username",
                    name: "Sponsor Name",
                    firstName: "Sponsor",
                    lastName: "Name",
                    profileImage: UnsplashUser.ProfileImage(
                        small: URL(string: "https://example.com/sponsor_small.jpg")!,
                        medium: URL(string: "https://example.com/sponsor_medium.jpg")!,
                        large: URL(string: "https://example.com/sponsor_large.jpg")!
                    ),
                    instagramUsername: "sponsor_insta",
                    totalPhotos: 5
                )
            )
        )
        
        // Act: Map to the domain model
        let mappedPhoto = PhotoMapper.mapToDomain(mockUnsplashPhoto)
        
        // Assert: Check that all properties are mapped correctly
        XCTAssertEqual(mappedPhoto.id, mockUnsplashPhoto.id)
        XCTAssertEqual(mappedPhoto.slug, mockUnsplashPhoto.slug)
        XCTAssertEqual(mappedPhoto.alternativeSlugs, mockUnsplashPhoto.alternativeSlugs)
        XCTAssertEqual(mappedPhoto.createdAt, mockUnsplashPhoto.createdAt)
        XCTAssertEqual(mappedPhoto.updatedAt, mockUnsplashPhoto.updatedAt)
        XCTAssertEqual(mappedPhoto.width, mockUnsplashPhoto.width)
        XCTAssertEqual(mappedPhoto.height, mockUnsplashPhoto.height)
        XCTAssertEqual(mappedPhoto.color, mockUnsplashPhoto.color)
        XCTAssertEqual(mappedPhoto.blurHash, mockUnsplashPhoto.blurHash)
        XCTAssertEqual(mappedPhoto.description, mockUnsplashPhoto.description)
        XCTAssertEqual(mappedPhoto.altDescription, mockUnsplashPhoto.altDescription)
        XCTAssertEqual(mappedPhoto.urls.raw, mockUnsplashPhoto.urls.raw)
        XCTAssertEqual(mappedPhoto.urls.full, mockUnsplashPhoto.urls.full)
        XCTAssertEqual(mappedPhoto.urls.regular, mockUnsplashPhoto.urls.regular)
        XCTAssertEqual(mappedPhoto.urls.small, mockUnsplashPhoto.urls.small)
        XCTAssertEqual(mappedPhoto.urls.thumb, mockUnsplashPhoto.urls.thumb)
        XCTAssertEqual(mappedPhoto.urls.smallS3, mockUnsplashPhoto.urls.smallS3)
        XCTAssertEqual(mappedPhoto.links.own, mockUnsplashPhoto.links.own)
        XCTAssertEqual(mappedPhoto.links.html, mockUnsplashPhoto.links.html)
        XCTAssertEqual(mappedPhoto.links.download, mockUnsplashPhoto.links.download)
        XCTAssertEqual(mappedPhoto.links.downloadLocation, mockUnsplashPhoto.links.downloadLocation)
        XCTAssertEqual(mappedPhoto.likesCount, mockUnsplashPhoto.likesCount)
        XCTAssertEqual(mappedPhoto.likedByUser, mockUnsplashPhoto.likedByUser)
        XCTAssertEqual(mappedPhoto.downloadsCount, mockUnsplashPhoto.downloadsCount)
        XCTAssertEqual(mappedPhoto.viewsCount, mockUnsplashPhoto.viewsCount)
        
        // Check nested user mapping
        XCTAssertEqual(mappedPhoto.user.id, mockUnsplashPhoto.user.id)
        XCTAssertEqual(mappedPhoto.user.username, mockUnsplashPhoto.user.username)
        XCTAssertEqual(mappedPhoto.user.name, mockUnsplashPhoto.user.name)
        XCTAssertEqual(mappedPhoto.user.firstName, mockUnsplashPhoto.user.firstName)
        XCTAssertEqual(mappedPhoto.user.lastName, mockUnsplashPhoto.user.lastName)
        XCTAssertEqual(mappedPhoto.user.profileImage.small, mockUnsplashPhoto.user.profileImage.small)
        XCTAssertEqual(mappedPhoto.user.profileImage.medium, mockUnsplashPhoto.user.profileImage.medium)
        XCTAssertEqual(mappedPhoto.user.profileImage.large, mockUnsplashPhoto.user.profileImage.large)
        XCTAssertEqual(mappedPhoto.user.instagramUsername, mockUnsplashPhoto.user.instagramUsername)
        XCTAssertEqual(mappedPhoto.user.totalPhotos, mockUnsplashPhoto.user.totalPhotos)
        
        // Check sponsorship mapping
        XCTAssertEqual(mappedPhoto.sponsorship?.tagline, mockUnsplashPhoto.sponsorship?.tagline)
        XCTAssertEqual(mappedPhoto.sponsorship?.sponsor.id, mockUnsplashPhoto.sponsorship?.sponsor.id)
        XCTAssertEqual(mappedPhoto.sponsorship?.sponsor.username, mockUnsplashPhoto.sponsorship?.sponsor.username)
        XCTAssertEqual(mappedPhoto.sponsorship?.sponsor.name, mockUnsplashPhoto.sponsorship?.sponsor.name)
    }
}
