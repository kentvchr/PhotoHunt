//
//  PhotoDetailsScreen.swift
//  PhotoHunt
//
//  Created by Quentin Verchère on 05/11/2024.
//

extension URLCache {
    
    static let imageCache = URLCache(memoryCapacity: 512*1000*1000, diskCapacity: 10*1000*1000*1000)
}

import SwiftUI

struct PhotoDetailsScreen: View {
    @State var viewModel: ViewModel
    
    init(photo: Photo) {
        _viewModel = State(wrappedValue: ViewModel(photo: photo))
    }
    
    @GestureState private var dragOffset = CGSize.zero
    
    var body: some View {
        ScrollView(.vertical) {
            if let photoDetails = viewModel.photoDetails {
                ZStack {
                    asyncImageView(photoDetails: photoDetails)
                        .offset(dragOffset)
                        .gesture(dragGesture)
                        .animation(.snappy, value: dragOffset)
                        .animation(.spring, value: viewModel.isExpanded)
                    
                    if !viewModel.isExpanded {
                        expandButtonView
                            .padding()
                            .frame(
                                maxWidth: .infinity,
                                maxHeight: .infinity,
                                alignment: .bottomTrailing
                            )
                    }
                }
                .padding(viewModel.isExpanded ? 0 : 32)
                .fixedSize(horizontal: false, vertical: true)
                
                if !viewModel.isExpanded {
                    Divider()
                        .padding(.horizontal)
                    photoDetailsView(photoDetails: photoDetails)
                        .padding(.top)
                }
            }
        }
        .task {
            await viewModel.loadPhotoDetails()
        }
        .navigationTitle(viewModel.photo.user.name)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    @ViewBuilder
    private func asyncImageView(photoDetails: PhotoDetails) -> some View {
        CachedAsyncImage(url: photoDetails.urls.full, urlCache: .imageCache) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(viewModel.isExpanded ? 0 : 16)
            case .failure:
                Image(systemName: "photo.badge.exclamationmark")
                    .foregroundColor(.gray)
            @unknown default:
                EmptyView()
            }
        }
    }
    
    private var expandButtonView: some View {
        Button {
            viewModel.isExpanded.toggle()
        } label: {
            Image(systemName: "arrow.up.left.and.arrow.down.right")
        }
        .capsuleButtonStyle()
    }
    
    @ViewBuilder
    private func photoDetailsView(photoDetails: PhotoDetails) -> some View {
        PhotoInformationsView(photoDetails: photoDetails)
    }
    
    
    // Drag Gesture to move the expanded photo
    private var dragGesture: some Gesture {
        DragGesture()
            .updating($dragOffset) { value, state, _ in
                if viewModel.isExpanded {
                    state = value.translation
                }
            }
            .onEnded { value in
                if viewModel.isExpanded && viewModel.isDismissThresholdReached(for: value.translation) {
                    viewModel.dismissView()
                }
            }
    }
}

#Preview {
    NavigationStack {
        PhotoDetailsScreen(photo: Photo.mocked)
    }
}
