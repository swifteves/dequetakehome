//
//  DequeListViewCell.swift
//  Deque
//
//  Created by Adrian Eves on 4/25/24.
//

import SwiftUI

struct CharacterListView: View {
    @Bindable
    var viewModel: DequeListViewModel
    var body: some View {
        List(viewModel.filteredCharacters) { character in
            NavigationLink(character.name, value: character)
        }
        .searchable(text: $viewModel.searchText)
        .navigationDestination(for: FranchiseCharacter.self, destination: CharacterDetailView.init)
    }
}
