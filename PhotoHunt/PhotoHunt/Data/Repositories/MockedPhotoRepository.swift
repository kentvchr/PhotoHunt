//
//  MockedPhotoRepository.swift
//  PhotoHunt
//
//  Created by Quentin Verchère on 04/11/2024.
//

import Foundation

class MockedPhotoRepository: PhotoRepositoryProtocol {
    private let networkManager = NetworkManager.shared
    private let api = UnsplashAPI()
    
    var shouldThrowError = false // Mocked state for testing
    
    func fetchRecentPhotos(page: Int = 1, perPage: Int = 30) async throws -> [UnsplashPhoto] {
        if shouldThrowError {
            throw URLError(.badURL)
        } else {
            let mockedUnsplashPhoto = PhotoMapper.mapToData(Photo.mocked)
            return [mockedUnsplashPhoto]
        }
    }
    
    func searchPhotos(query: String, page: Int = 1, perPage: Int = 30) async throws -> [UnsplashPhoto] {
        if shouldThrowError {
            throw URLError(.badURL)
        } else {
            let mockedUnsplashPhoto = PhotoMapper.mapToData(Photo.mocked)
            return [mockedUnsplashPhoto]
        }
    }
    
    func fetchPhotoDetails(photoId: String) async throws -> UnsplashPhotoDetails {
        if shouldThrowError {
            throw URLError(.badURL)
        } else {
            let mockedUnsplashPhotoDetails = PhotoDetailsMapper.mapToData(PhotoDetails.mocked)
            return mockedUnsplashPhotoDetails
        }
    }
}
