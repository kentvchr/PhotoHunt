//
//  Location.swift
//  PhotoHunt
//
//  Created by Quentin Verchère on 05/11/2024.
//

public class Location {
    init(city: String? = nil, country: String? = nil, position: Location.Position? = nil) {
        self.city = city
        self.country = country
        self.position = position
    }
    
    let city: String?
    let country: String?
    let position: Position?
    
    class Position {
        init(latitude: Double? = nil, longitude: Double? = nil) {
            self.latitude = latitude
            self.longitude = longitude
        }
        
        let latitude: Double?
        let longitude: Double?
    }
    
    static let mocked = Location(
        city: "Montreal",
        country: "Canada",
        position: Location.Position(latitude: 45.473298, longitude: -73.638488)
    )
}
