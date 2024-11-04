//
//  PhotosScrollView.swift
//  PhotoHunt
//
//  Created by Quentin Verchère on 04/11/2024.
//

import SwiftUI

struct PhotosListView: View {
    @Environment(HomeScreen.ViewModel.self) private var viewModel
    
    private var adaptiveColumns: [GridItem] {
        let minimumSize: CGFloat = UIDevice.current.userInterfaceIdiom == .pad ? 200 : 100
        return [GridItem(.adaptive(minimum: minimumSize), spacing: 4)]
    }
    
    var body: some View {
        LazyVGrid(columns: adaptiveColumns, spacing: 4) {
            ForEach(viewModel.photos, id: \.id) { photo in
                PhotoThumbnailView(photoURL: photo.urls.thumb)
            }
        }
        .padding(.horizontal, 4)
    }
}

//MARK: Previews

#Preview {
    PhotosScrollViewPreviewContainer()
}

struct PhotosScrollViewPreviewContainer: View {
    @State private var viewModel = HomeScreen.ViewModel()
    
    var body: some View {
        PhotosListView()
            .environment(viewModel)
            .task {
                await viewModel.fetchRecentPhotos()
            }
    }
}

#Preview {
    HomeScreen()
}
