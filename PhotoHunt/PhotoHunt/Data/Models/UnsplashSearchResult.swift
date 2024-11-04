//
//  UnsplashSearchResult.swift
//  PhotoHunt
//
//  Created by Quentin Verchère on 04/11/2024.
//


struct UnsplashSearchResult: Decodable {
    let total: Int
    let totalPages: Int
    let results: [UnsplashPhoto]

    private enum CodingKeys: String, CodingKey {
        case total
        case totalPages = "total_pages"
        case results
    }
}
