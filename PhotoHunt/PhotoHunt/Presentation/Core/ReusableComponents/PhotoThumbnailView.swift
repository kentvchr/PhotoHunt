//
//  PhotoThumbnailView.swift
//  PhotoHunt
//
//  Created by Quentin Verchère on 04/11/2024.
//


import SwiftUI

struct PhotoThumbnailView: View {
    let photoURL: URL
    
    @State private var image: UIImage? = nil
    @State private var isLoading = true
    
    var body: some View {
        AsyncImage(url: photoURL) { phase in
            switch phase {
            case .empty:
                ProgressView()
                    .frame(width: 150, height: 150)
            case .success(let image):
                image
                    .resizable()
                    .frame(width: 150, height: 150)
                    .scaledToFill()
                    .cornerRadius(UIConstants.cornerRadius)
            case .failure:
                Image(systemName: "photo.badge.exclamationmark")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .foregroundColor(.gray)
            @unknown default:
                EmptyView()
            }
        }
    }
}

#Preview {
    PhotoThumbnailView(photoURL: .init(string: "https://images.unsplash.com/photo-1719937206642-ca0cd57198cc?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w2NzEzNjZ8MXwxfGFsbHwxfHx8fHx8fHwxNzMwNjczMDY0fA&ixlib=rb-4.0.3&q=80&w=200")!)
}
