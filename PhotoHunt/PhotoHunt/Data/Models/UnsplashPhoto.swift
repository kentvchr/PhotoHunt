//
//  UnsplashPhoto.swift
//  PhotoHunt
//
//  Created by Quentin Verchère on 04/11/2024.
//


import SwiftUI

public struct UnsplashPhoto: Codable, Identifiable {
    
    public struct URLs: Codable {
        public let raw: URL
        public let full: URL
        public let regular: URL
        public let small: URL
        public let thumb: URL
        public let smallS3: URL

        private enum CodingKeys: String, CodingKey {
            case raw, full, regular, small, thumb, smallS3 = "small_s3"
        }
        
        public init(raw: URL, full: URL, regular: URL, small: URL, thumb: URL, smallS3: URL) {
            self.raw = raw
            self.full = full
            self.regular = regular
            self.small = small
            self.thumb = thumb
            self.smallS3 = smallS3
        }
    }

    public struct Links: Codable {
        public let own: URL?
        public let html: URL?
        public let download: URL?
        public let downloadLocation: URL?
        
        private enum CodingKeys: String, CodingKey {
            case own, html, download, downloadLocation = "download_location"
        }
        
        public init(own: URL? = nil, html: URL? = nil, download: URL? = nil, downloadLocation: URL? = nil) {
            self.own = own
            self.html = html
            self.download = download
            self.downloadLocation = downloadLocation
        }
    }

    public let id: String
    public let slug: String?
    public let alternativeSlugs: [String: String]?
    public let createdAt: String?
    public let updatedAt: String?
    public let width: Int?
    public let height: Int?
    public let color: Color?
    public let blurHash: String?
    public let description: String?
    public let altDescription: String?
    public let urls: URLs
    public let links: Links
    public let likesCount: Int
    public let likedByUser: Bool?
    public let downloadsCount: Int?
    public let viewsCount: Int?
    public let user: UnsplashUser
    public let sponsorship: UnsplashSponsorship?

    private enum CodingKeys: String, CodingKey {
        case id
        case slug
        case alternativeSlugs = "alternative_slugs"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case width, height, color, blurHash = "blur_hash"
        case description, altDescription = "alt_description"
        case urls, links, likesCount = "likes"
        case likedByUser = "liked_by_user"
        case downloadsCount = "downloads"
        case viewsCount = "views"
        case user, sponsorship
    }
    
    public init(id: String, slug: String? = nil, alternativeSlugs: [String : String]? = nil, createdAt: String? = nil, updatedAt: String? = nil, width: Int? = nil, height: Int? = nil, color: Color? = nil, blurHash: String? = nil, description: String? = nil, altDescription: String? = nil, urls: UnsplashPhoto.URLs, links: UnsplashPhoto.Links, likesCount: Int, likedByUser: Bool? = nil, downloadsCount: Int? = nil, viewsCount: Int? = nil, user: UnsplashUser, sponsorship: UnsplashSponsorship? = nil) {
        self.id = id
        self.slug = slug
        self.alternativeSlugs = alternativeSlugs
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.width = width
        self.height = height
        self.color = color
        self.blurHash = blurHash
        self.description = description
        self.altDescription = altDescription
        self.urls = urls
        self.links = links
        self.likesCount = likesCount
        self.likedByUser = likedByUser
        self.downloadsCount = downloadsCount
        self.viewsCount = viewsCount
        self.user = user
        self.sponsorship = sponsorship
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(String.self, forKey: .id)
        slug = try? container.decode(String.self, forKey: .slug)
        alternativeSlugs = try? container.decode([String: String].self, forKey: .alternativeSlugs)
        createdAt = try? container.decode(String.self, forKey: .createdAt)
        updatedAt = try? container.decode(String.self, forKey: .updatedAt)
        width = try? container.decode(Int.self, forKey: .width)
        height = try? container.decode(Int.self, forKey: .height)
        
        // Decode color as hex string and convert to Color
        if let hexColor = try? container.decode(String.self, forKey: .color) {
            color = Color(hex: hexColor)
        } else {
            color = nil
        }
        
        blurHash = try? container.decode(String.self, forKey: .blurHash)
        description = try? container.decode(String.self, forKey: .description)
        altDescription = try? container.decode(String.self, forKey: .altDescription)
        urls = try container.decode(URLs.self, forKey: .urls)
        links = try container.decode(Links.self, forKey: .links)
        likesCount = try container.decode(Int.self, forKey: .likesCount)
        likedByUser = try? container.decode(Bool.self, forKey: .likedByUser)
        downloadsCount = try? container.decode(Int.self, forKey: .downloadsCount)
        viewsCount = try? container.decode(Int.self, forKey: .viewsCount)
        user = try container.decode(UnsplashUser.self, forKey: .user)
        sponsorship = try? container.decode(UnsplashSponsorship.self, forKey: .sponsorship)
    }
    
    public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)

            try container.encode(id, forKey: .id)
            try container.encodeIfPresent(slug, forKey: .slug)
            try container.encodeIfPresent(alternativeSlugs, forKey: .alternativeSlugs)
            try container.encodeIfPresent(createdAt, forKey: .createdAt)
            try container.encodeIfPresent(updatedAt, forKey: .updatedAt)
            try container.encodeIfPresent(width, forKey: .width)
            try container.encodeIfPresent(height, forKey: .height)

            // Encode color as hex string if available
            if let colorHex = color?.toHex() {
                try container.encode(colorHex, forKey: .color)
            }

            try container.encodeIfPresent(blurHash, forKey: .blurHash)
            try container.encodeIfPresent(description, forKey: .description)
            try container.encodeIfPresent(altDescription, forKey: .altDescription)
            try container.encode(urls, forKey: .urls)
            try container.encode(links, forKey: .links)
            try container.encode(likesCount, forKey: .likesCount)
            try container.encodeIfPresent(likedByUser, forKey: .likedByUser)
            try container.encodeIfPresent(downloadsCount, forKey: .downloadsCount)
            try container.encodeIfPresent(viewsCount, forKey: .viewsCount)
            try container.encode(user, forKey: .user)
            try container.encodeIfPresent(sponsorship, forKey: .sponsorship)
        }
}
