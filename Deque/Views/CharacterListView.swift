//
//  DequeListViewCell.swift
//  Deque
//
//  Created by Adrian Eves on 4/25/24.
//

import SwiftUI

struct CharacterListView: View {
    @State private var searchText = ""
    var characters: [FranchiseCharacter]
    
    var body: some View {
        List(characters) { character in
            if let name = character.name {
                NavigationLink("\(name)", value: character)
            }
        }
        .searchable(text: $searchText)
        .navigationDestination(for: FranchiseCharacter.self, destination: CharacterDetailView.init)
    }
}

//#Preview {
//    DequeListView()
//}
