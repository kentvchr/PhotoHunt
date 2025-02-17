//
//  UnsplashLocation.swift
//  PhotoHunt
//
//  Created by Quentin Verchère on 05/11/2024.
//

public struct UnsplashLocation: Codable {
    let city: String?
    let country: String?
    let position: Position?
    
    struct Position: Codable {
        let latitude: Double?
        let longitude: Double?
    }
}

