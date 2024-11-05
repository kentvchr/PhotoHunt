//
//  UnsplashPhotoLinks.swift
//  PhotoHunt
//
//  Created by Quentin Verchère on 05/11/2024.
//

import Foundation

public struct UnsplashPhotoLinks: Codable {
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
