//
//  ContentView.swift
//  Deque
//
//  Created by Adrian Eves on 4/22/24.
//

import SwiftUI

struct DequeView: View {
    @State private var viewModel = DequeListViewModel(network: DequeNetworking())
    
    var body: some View {
        NavigationStack {
            VStack {
                switch viewModel.loadingState {
                case .loading:
                    LoadingView()
                case .loaded:
                    CharacterListView(characters: viewModel.charactersList)
                case .failed:
                    VStack {
                        LoadingFailedView()
                        Button("Retry") {
                            Task {
                                await viewModel.retrieveCharacters()
                            }
                        }
                    }
                }
            }
            .task {
                await viewModel.retrieveCharacters()
            }
            .navigationTitle("Deque Take-Home")
        }
    }
}

#Preview {
    DequeView()
}
