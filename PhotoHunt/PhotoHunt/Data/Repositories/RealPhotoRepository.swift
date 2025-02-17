//
//  RealPhotoRepository.swift
//  PhotoHunt
//
//  Created by Quentin Verchère on 04/11/2024.
//

import Foundation

class RealPhotoRepository: PhotoRepositoryProtocol {
    private let networkManager = NetworkManager.shared
    private let api = UnsplashAPI()
    
    func fetchRecentPhotos(page: Int = 1, perPage: Int = 30) async throws -> [UnsplashPhoto] {
        guard let request = api.recentPhotos(page: page, perPage: perPage) else {
            throw URLError(.badURL)
        }
        return try await networkManager.request(request, responseType: [UnsplashPhoto].self)
    }
    
    func searchPhotos(query: String, page: Int = 1, perPage: Int = 30) async throws -> [UnsplashPhoto] {
        guard let request = api.searchPhotos(query: query, page: page, perPage: perPage) else {
            throw URLError(.badURL)
        }
        let searchResult: UnsplashSearchResult = try await networkManager.request(request, responseType: UnsplashSearchResult.self)
        return searchResult.results
    }
    
    func fetchPhotoDetails(photoId: String) async throws -> UnsplashPhotoDetails {
        guard let request = api.photoDetails(id: photoId) else {
            throw URLError(.badURL)
        }
        print(request)
        return try await networkManager.request(request, responseType: UnsplashPhotoDetails.self)
    }
}
