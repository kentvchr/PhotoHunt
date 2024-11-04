//
//  HomeScreen.swift
//  PhotoHunt
//
//  Created by Quentin Verchère on 04/11/2024.
//

import SwiftUI

struct HomeScreen: View {
    @State var viewModel = ViewModel()
    
    var body: some View {
        ScrollView(.vertical) {
            PhotosListView()
                .offset(y: viewModel.scrollProgress * 75) // Cancel scroll acceleration due to header height change
                .safeAreaInset(edge: .top, spacing: 0) {
                    ResizableHeaderView()
                }
        }
        .environment(viewModel)
        .onScrollGeometryChange(for: CGFloat.self) {
            $0.contentOffset.y + $0.contentInsets.top
        } action: { oldValue, newValue in
            viewModel.scrollProgress = max(min(newValue / 75, 1), 0) // 75 = HStack height + bottom padding
        }
        .task {
            await viewModel.fetchRecentPhotos()
        }
    }
}

#Preview {
    HomeScreen()
}
