//
//  PhotoInteractor.swift
//  PhotoHunt
//
//  Created by Quentin Verchère on 04/11/2024.
//

class PhotoInteractor {
    private let photoRepository: PhotoRepositoryProtocol
    
    init(photoRepository: PhotoRepositoryProtocol) {
        self.photoRepository = photoRepository
    }
    
    convenience init(type: PhotoRepositoryType) {
        switch type {
        case .real:
            self.init(photoRepository: RealPhotoRepository())
        case .mocked:
            self.init(photoRepository: MockedPhotoRepository())
        }
    }
    
    func fetchRecentPhotos(page: Int = 1, perPage: Int = 30) async throws -> [Photo] {
        let result = try await photoRepository.fetchRecentPhotos(page: page, perPage: perPage)
        return result.map { unsplashPhoto in
            PhotoMapper.mapToDomain(unsplashPhoto)
        }
    }
    
    func searchPhotos(query: String, page: Int = 1, perPage: Int = 30) async throws -> [Photo] {
        let result = try await photoRepository.searchPhotos(query: query, page: page, perPage: perPage)
        return result.map { unsplashPhoto in
            PhotoMapper.mapToDomain(unsplashPhoto)
        }
    }
}
