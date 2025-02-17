//
//  PhotoURLs.swift
//  PhotoHunt
//
//  Created by Quentin Verchère on 05/11/2024.
//

import Foundation

public class PhotoURLs {
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
    
    static let mocked = PhotoURLs(
        raw: URL(string: "https://images.unsplash.com/photo-1417325384643-aac51acc9e5d")!,
        full: URL(string: "https://images.unsplash.com/photo-1417325384643-aac51acc9e5d?q=75&fm=jpg")!,
        regular: URL(string: "https://images.unsplash.com/photo-1417325384643-aac51acc9e5d?q=75&fm=jpg&w=1080&fit=max")!,
        small: URL(string: "https://images.unsplash.com/photo-1417325384643-aac51acc9e5d?q=75&fm=jpg&w=400&fit=max")!,
        thumb: URL(string: "https://images.unsplash.com/photo-1417325384643-aac51acc9e5d?q=75&fm=jpg&w=200&fit=max")!,
        smallS3: URL(string: "https://s3.amazonaws.com/images.unsplash.com/small/photo-1417325384643-aac51acc9e5d")!
    )
}
