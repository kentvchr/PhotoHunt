//
//  PhotoThumbnailView.swift
//  PhotoHunt
//
//  Created by Quentin Verchère on 04/11/2024.
//


import SwiftUI

struct PhotoThumbnailView: View {
    let photoURL: URL
    
    var body: some View {
        GeometryReader { geometry in
            let itemSize = geometry.size.width
            
            AsyncImage(url: photoURL) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(width: itemSize, height: itemSize)
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: itemSize, height: itemSize)
                        .clipped()
                        .cornerRadius(UIConstants.thumbnailCornerRadius) 
                case .failure:
                    Image(systemName: "photo.badge.exclamationmark")
                        .resizable()
                        .scaledToFit()
                        .frame(width: itemSize, height: itemSize)
                        .foregroundColor(.gray)
                @unknown default:
                    EmptyView()
                }
            }
        }
        .aspectRatio(1, contentMode: .fit) // Ensures a square layout
    }
}

#Preview {
    PhotoThumbnailView(photoURL: .init(string: "https://images.unsplash.com/photo-1719937206642-ca0cd57198cc?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w2NzEzNjZ8MXwxfGFsbHwxfHx8fHx8fHwxNzMwNjczMDY0fA&ixlib=rb-4.0.3&q=80&w=200")!)
}

#Preview {
    HomeScreen()
}
