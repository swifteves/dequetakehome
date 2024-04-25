//
//  DequeListViewCell.swift
//  Deque
//
//  Created by Adrian Eves on 4/25/24.
//

import SwiftUI

struct DequeListView: View {
    var characters: [FranchiseCharacter]
    
    var body: some View {
        List(characters, id: \.id) { character in
            NavigationLink("\(character.name!)", value: character)
        }
        .navigationDestination(for: FranchiseCharacter.self) { character in
            DequeDetailView(character: character)
        }
    }
}

//#Preview {
//    DequeListView()
//}
