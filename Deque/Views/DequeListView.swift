//
//  ContentView.swift
//  Deque
//
//  Created by Adrian Eves on 4/22/24.
//

import SwiftUI

struct DequeListView: View {
    @State private var viewModel = DequeListViewModel(network: DequeNetworking())
    var body: some View {
        NavigationStack {
            VStack {
                switch viewModel.loadingState {
                case .loading:
                    LoadingView()
                case .loaded:
                    List {
                        // TODO: ForEach in viewmodel's characters collection
                        ForEach(viewModel.charactersList, id: \.id) { character in
                            NavigationLink(destination: DequeDetailView(character: character)) {
                                Text("\(character.name!)")
                            }
                        }
                    }
                case .failed:
                    LoadingFailedView()
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
    DequeListView()
}
