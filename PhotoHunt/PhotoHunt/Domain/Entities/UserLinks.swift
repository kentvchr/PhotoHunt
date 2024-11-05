//
//  UserLinks.swift
//  PhotoHunt
//
//  Created by Quentin Verchère on 05/11/2024.
//

import Foundation

public class UserLinks {
    internal init(own: URL, html: URL, photos: URL, likes: URL, portfolio: URL? = nil) {
        self.own = own
        self.html = html
        self.photos = photos
        self.likes = likes
        self.portfolio = portfolio
    }    
    
    let own: URL
    let html: URL
    let photos: URL
    let likes: URL
    let portfolio: URL?
    
    static let mocked = UserLinks(
        own: URL(string: "https://api.unsplash.com/users/exampleuser")!,
        html: URL(string: "https://unsplash.com/exampleuser")!,
        photos: URL(string: "https://api.unsplash.com/users/exampleuser/photos")!,
        likes: URL(string: "https://api.unsplash.com/users/exampleuser/likes")!,
        portfolio: URL(string: "https://api.unsplash.com/users/exampleuser/portfolio")!
    )
}
