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
        VStack {
            PhotosScrollView()
        }
        .environment(viewModel)
        .task {
            await viewModel.fetchRecentPhotos()
        }
    }
}

#Preview {
    HomeScreen()
}
