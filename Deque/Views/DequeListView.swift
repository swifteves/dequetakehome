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
            List {
                // TODO: ForEach in viewmodel's characters collection
                ForEach(viewModel.charactersList, id: \.id) { character in
                    Text("\(character.name!)")
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
