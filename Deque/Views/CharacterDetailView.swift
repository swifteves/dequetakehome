//
//  DequeDetailView.swift
//  Deque
//
//  Created by Adrian Eves on 4/22/24.
//

import SwiftUI

struct CharacterDetailView: View {
    var character: FranchiseCharacter
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                VStack(spacing: 10) {
                    if let imageUrl = character.image?.originalUrl {
                        AsyncImage(url: URL(string: imageUrl)) { image in
                            image
                                .resizable()
                                .scaledToFit()
                        } placeholder: {
                            Image(systemName: "tray.fill")
                        }
                        .frame(width: 250, height: 250)
                    }
                }
                
                // Display name
                if let name = character.name {
                    Text(character.name!)
                        .font(.largeTitle)
                }
                
                // Display real name
                if let realName = character.realName {
                    Text("***Real Name:*** \(realName)")
                }
                
                // Display aliases
                if let aliases = character.aliases {
                    Text("***Known Aliases:*** \(character.formattedAliases)")
                }
                
                // Display description
                if let description = character.description {
                    VStack(spacing: 10) {
                        Text("***Description:***")
                        Text(description.displayHtml())
                    }
                }
            }
        }
        .contentMargins(10, for: .scrollContent)
    }
}

//#Preview {
//    DequeDetailView()
//}
