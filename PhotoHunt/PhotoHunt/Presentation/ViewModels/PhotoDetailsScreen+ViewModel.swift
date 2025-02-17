//
//  PhotoDetailsScreen+ViewModel.swift
//  PhotoHunt
//
//  Created by Quentin Verchère on 05/11/2024.
//

import SwiftUI

extension PhotoDetailsScreen {
    @Observable
    class ViewModel {
        internal init(photo: Photo) {
            self.photo = photo
        }
        
        internal var photo: Photo
        internal var photoDetails: PhotoDetails?
        internal var isExpanded: Bool = false
        internal var errorMessage: String?
        
        private let photoInteractor: PhotoInteractor = PhotoInteractor(type: .real)
        
        internal func loadPhotoDetails() async {
            do {
                let photoDetails = try await photoInteractor.fetchPhoto(id: photo.id)
                self.photoDetails = photoDetails
            } catch {
                self.errorMessage = "Failed to load photo details: \(error.localizedDescription)"
            }
        }
        
        // MARK: - Drag Gesture
        // Checks if the offset meets the threshold for dismissal
        internal func isDismissThresholdReached(for offset: CGSize) -> Bool {
            return abs(offset.width) > 150 || abs(offset.height) > 150
        }
        
        internal func dismissView() {
            isExpanded = false
        }
    }
}
