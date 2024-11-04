//
//  SponsorshipMapper.swift
//  PhotoHunt
//
//  Created by Quentin Verchère on 04/11/2024.
//

struct SponsorshipMapper {
    /// Maps `UnsplashSponsorship` (data layer) to `Sponsorship` (domain layer)
    static func mapToDomain(_ sponsorship: UnsplashSponsorship) -> Sponsorship {
        return Sponsorship(tagline: sponsorship.tagline, sponsor: UserMapper.mapToDomain(sponsorship.sponsor))
    }
    
    /// Maps `Sponsorship` (domain layer) to `UnsplashSponsorship` (data layer)
    static func mapToData(_ sponsorship: Sponsorship) -> UnsplashSponsorship {
        return UnsplashSponsorship(tagline: sponsorship.tagline, sponsor: UserMapper.mapToData(sponsorship.sponsor))
    }
}
