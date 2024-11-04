//
//  PhotoRepositoryProtocol.swift
//  PhotoHunt
//
//  Created by Quentin Verchère on 04/11/2024.
//

import Foundation

protocol PhotoRepositoryProtocol {
    func fetchRecentPhotos(page: Int, perPage: Int) async throws -> [UnsplashPhoto]
    func searchPhotos(query: String, page: Int, perPage: Int) async throws -> [UnsplashPhoto]
}

enum PhotoRepositoryType {
    case real
    case mocked
}
