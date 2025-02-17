//
//  ResizableHeaderView.swift
//  PhotoHunt
//
//  Created by Quentin Verchère on 04/11/2024.
//

import SwiftUI

struct ResizableHeaderView: View {
    @Environment(HomeScreen.ViewModel.self) private var viewModel
    
    var body: some View {
        @Bindable var viewModel: HomeScreen.ViewModel = viewModel
        VStack(spacing: 0) {
            HStack {
                VStack(alignment: .leading) {
                    Text("Welcome on")
                        .font(.callout)
                        .foregroundStyle(.gray)
                    Text("PhotoHunt")
                        .font(.title.bold())
                }
                Spacer()
            }
            .frame(height: 60 - (60 * viewModel.scrollProgress), alignment: .bottom)
            .padding(.leading)
            .padding(.top, 15)
            .padding(.bottom, 15 - (15 * viewModel.scrollProgress))
            .opacity(1 - viewModel.scrollProgress)
            .offset(y: -10 * viewModel.scrollProgress)
            
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Search Photos", text: $viewModel.searchText)
                    .submitLabel(.search)
                    .onSubmit {
                        viewModel.onSubmitSearch()
                    }
            }
            .padding()
            .background {
                RoundedRectangle(cornerRadius: UIConstants.textFieldCornerRadius)
                    .fill(.background
                        .shadow(.drop(color: .black.opacity(0.08), radius: 5, x: 5, y: 5))
                        .shadow(.drop(color: .black.opacity(0.05), radius: 5, x: -5, y: -5))
                    )
            }
            .padding(.horizontal, 15)
            .padding(.bottom, 15)
            .padding(.top, 5)
        }
        .background {
            ProgressiveBlurView()
                .blur(radius: 4)
                .padding(.top, -64)
        }
        .visualEffect { content, proxy in
            content.offset(y: offsetY(proxy))
        }
    }
    
    nonisolated private func offsetY(_ proxy: GeometryProxy) -> CGFloat {
        let minY = proxy.frame(in: .scrollView(axis: .vertical)).minY
        return minY > 0 ? 0 : -minY
    }
}

#Preview {
    ResizableHeaderView()
        .environment(HomeScreen.ViewModel())
}

#Preview {
    HomeScreen()
}
