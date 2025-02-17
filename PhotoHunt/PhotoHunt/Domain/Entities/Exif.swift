//
//  Exif.swift
//  PhotoHunt
//
//  Created by Quentin Verchère on 05/11/2024.
//

public class Exif {
    init(make: String? = nil, model: String? = nil, name: String? = nil, exposureTime: String? = nil, aperture: String? = nil, focalLength: String? = nil, iso: Int? = nil) {
        self.make = make
        self.model = model
        self.name = name
        self.exposureTime = exposureTime
        self.aperture = aperture
        self.focalLength = focalLength
        self.iso = iso
    }
    
    let make: String?
    let model: String?
    let name: String?
    let exposureTime: String?
    let aperture: String?
    let focalLength: String?
    let iso: Int?
    
    static let mocked = Exif(
        make: "Canon",
        model: "Canon EOS 40D",
        name: "Canon, EOS 40D",
        exposureTime: "0.011111111111111112",
        aperture: "4.970854",
        focalLength: "37",
        iso: 100
    )
}
