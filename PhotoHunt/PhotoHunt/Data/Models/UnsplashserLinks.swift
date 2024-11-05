//
//  UnsplashUserLinks.swift
//  PhotoHunt
//
//  Created by Quentin Verchère on 05/11/2024.
//

import Foundation

public struct UnsplashUserLinks: Codable {
    let own: URL
    let html: URL
    let photos: URL
    let likes: URL
    let portfolio: URL?
    
    private enum CodingKeys: String, CodingKey {
        case own = "self", html, photos, likes, portfolio
    }
}
