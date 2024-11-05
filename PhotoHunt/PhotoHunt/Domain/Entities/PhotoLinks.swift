//
//  PhotoLinks.swift
//  PhotoHunt
//
//  Created by Quentin Verchère on 05/11/2024.
//


import Foundation

public class PhotoLinks {
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
    
    static let mocked = PhotoLinks(
        own: URL(string: "https://api.unsplash.com/photos/Dwu85P9SOIk")!,
        html: URL(string: "https://unsplash.com/photos/Dwu85P9SOIk")!,
        download: URL(string: "https://unsplash.com/photos/Dwu85P9SOIk/download")!,
        downloadLocation: URL(string: "https://api.unsplash.com/photos/Dwu85P9SOIk/download")!
    )
}
