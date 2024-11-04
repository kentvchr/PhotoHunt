//
//  HomeScreen+ViewModel.swift
//  PhotoHunt
//
//  Created by Quentin Verchère on 04/11/2024.
//

import SwiftUI

extension HomeScreen {
    @Observable
    public class ViewModel {
        var navigationPath = NavigationPath()
        
        public var searchText: String = ""
        public var errorMessage: String?
        
        private(set) var photos: [Photo] = []
        private(set) var isLoading = false
        
        private let photoInteractor: PhotoInteractor = PhotoInteractor(type: .real)
        
        func fetchRecentPhotos(page: Int = 1, perPage: Int = 30) async {
            isLoading = true
            defer { isLoading = false }
            
            do {
                let fetchedPhotos = try await photoInteractor.fetchRecentPhotos(page: page, perPage: perPage)
                self.photos = fetchedPhotos
            } catch {
                self.errorMessage = "Failed to load photos: \(error.localizedDescription)"
            }
        }
        
        func onSubmitSearch(for query: String) {
            if query.isEmpty {
                errorMessage = "Please enter a search term."
            } else {
                Task {
                    await searchPhotos(query: query)
                }
            }
        }
        
        func onChangeSearch(_ query: String) {
            if query.isEmpty {
                Task { await fetchRecentPhotos() }
            }
        }
        
        func searchPhotos(query: String) async {
            isLoading = true
            defer { isLoading = false }
            
            do {
                let fetchedPhotos = try await photoInteractor.searchPhotos(query: query)
                self.photos = fetchedPhotos
            } catch {
                self.errorMessage = "Failed to load photos: \(error.localizedDescription)"
            }
        }
    }
}
