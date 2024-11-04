//
//  Photo.swift
//  PhotoHunt
//
//  Created by Quentin Verchère on 04/11/2024.
//

import Foundation
import SwiftUI

public class Photo: Identifiable {
    init(id: String, slug: String? = nil, alternativeSlugs: [String : String]? = nil, createdAt: String? = nil, updatedAt: String? = nil, width: Int? = nil, height: Int? = nil, color: Color? = nil, blurHash: String? = nil, description: String? = nil, altDescription: String? = nil, urls: Photo.URLs, links: Photo.Links, likesCount: Int, likedByUser: Bool? = nil, downloadsCount: Int? = nil, viewsCount: Int? = nil, user: User, sponsorship: Sponsorship? = nil) {
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
    
    public class URLs {
        init(raw: URL, full: URL, regular: URL, small: URL, thumb: URL, smallS3: URL) {
            self.raw = raw
            self.full = full
            self.regular = regular
            self.small = small
            self.thumb = thumb
            self.smallS3 = smallS3
        }
        
        public let raw: URL
        public let full: URL
        public let regular: URL
        public let small: URL
        public let thumb: URL
        public let smallS3: URL
    }

    public class Links {
        init(own: URL? = nil, html: URL? = nil, download: URL? = nil, downloadLocation: URL? = nil) {
            self.own = own
            self.html = html
            self.download = download
            self.downloadLocation = downloadLocation
        }
        
        public let own: URL?
        public let html: URL?
        public let download: URL?
        public let downloadLocation: URL?
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
    public let user: User
    public let sponsorship: Sponsorship?
    
    public static let mocked = Photo(
        id: "QpLJ8Kw5S0Q",
        slug: "a-person-sitting-on-a-rock-with-a-camera-QpLJ8Kw5S0Q",
        alternativeSlugs: [
            "en": "a-person-sitting-on-a-rock-with-a-camera-QpLJ8Kw5S0Q",
            "fr": "une-personne-assise-sur-un-rocher-avec-un-appareil-photo-QpLJ8Kw5S0Q"
        ],
        createdAt: "2024-07-02T16:21:05Z",
        updatedAt: "2024-10-01T18:27:58Z",
        width: 3600,
        height: 2700,
        color: Color(hex: "#737373"), // Replace with your color initializer if necessary
        blurHash: "LSFYGiIUxvM{0K-;Mxog-:IUtRt6",
        description: nil,
        altDescription: "A person sitting on a rock with a camera",
        urls: Photo.URLs(
            raw: URL(string: "https://images.unsplash.com/photo-1719937206642-ca0cd57198cc?ixid=M3w2NzEzNjZ8MXwxfGFsbHwxfHx8fHx8fHwxNzMwNjczMDY0fA&ixlib=rb-4.0.3")!,
            full: URL(string: "https://images.unsplash.com/photo-1719937206642-ca0cd57198cc?crop=entropy&cs=srgb&fm=jpg&ixid=M3w2NzEzNjZ8MXwxfGFsbHwxfHx8fHx8fHwxNzMwNjczMDY0fA&ixlib=rb-4.0.3&q=85")!,
            regular: URL(string: "https://images.unsplash.com/photo-1719937206642-ca0cd57198cc?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w2NzEzNjZ8MXwxfGFsbHwxfHx8fHx8fHwxNzMwNjczMDY0fA&ixlib=rb-4.0.3&q=80&w=1080")!,
            small: URL(string: "https://images.unsplash.com/photo-1719937206642-ca0cd57198cc?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w2NzEzNjZ8MXwxfGFsbHwxfHx8fHx8fHwxNzMwNjczMDY0fA&ixlib=rb-4.0.3&q=80&w=400")!,
            thumb: URL(string: "https://images.unsplash.com/photo-1719937206642-ca0cd57198cc?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w2NzEzNjZ8MXwxfGFsbHwxfHx8fHx8fHwxNzMwNjczMDY0fA&ixlib=rb-4.0.3&q=80&w=200")!,
            smallS3: URL(string: "https://s3.us-west-2.amazonaws.com/images.unsplash.com/small/photo-1719937206642-ca0cd57198cc")!
        ),
        links: Photo.Links(
            own: URL(string: "https://api.unsplash.com/photos/a-person-sitting-on-a-rock-with-a-camera-QpLJ8Kw5S0Q"),
            html: URL(string: "https://unsplash.com/photos/a-person-sitting-on-a-rock-with-a-camera-QpLJ8Kw5S0Q"),
            download: URL(string: "https://unsplash.com/photos/QpLJ8Kw5S0Q/download?ixid=M3w2NzEzNjZ8MXwxfGFsbHwxfHx8fHx8fHwxNzMwNjczMDY0fA"),
            downloadLocation: URL(string: "https://api.unsplash.com/photos/QpLJ8Kw5S0Q/download?ixid=M3w2NzEzNjZ8MXwxfGFsbHwxfHx8fHx8fHwxNzMwNjczMDY0fA")
        ),
        likesCount: 60,
        likedByUser: false,
        downloadsCount: nil,
        viewsCount: nil,
        user: User.mocked,
        sponsorship: Sponsorship.mocked
    )
}
