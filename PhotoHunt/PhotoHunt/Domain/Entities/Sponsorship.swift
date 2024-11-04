//
//  Sponsorship.swift
//  PhotoHunt
//
//  Created by Quentin Verchère on 04/11/2024.
//

public class Sponsorship {
    init(tagline: String, sponsor: User) {
        self.tagline = tagline
        self.sponsor = sponsor
    }
    
    public let tagline: String
    public let sponsor: User
    
    public static let mocked = Sponsorship(
        tagline: "Memory for every endeavor",
        sponsor: User.mocked
    )
}
