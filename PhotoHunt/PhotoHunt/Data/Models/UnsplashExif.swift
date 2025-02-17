//
//  UnsplashExif.swift
//  PhotoHunt
//
//  Created by Quentin Verchère on 05/11/2024.
//

public struct UnsplashExif: Codable {
    let make: String?
    let model: String?
    let name: String?
    let exposureTime: String?
    let aperture: String?
    let focalLength: String?
    let iso: Int?
    
    private enum CodingKeys: String, CodingKey {
        case make, model, name, exposureTime = "exposure_time"
        case aperture, focalLength = "focal_length", iso
    }
}
