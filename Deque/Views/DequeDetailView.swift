//
//  DequeDetailView.swift
//  Deque
//
//  Created by Adrian Eves on 4/22/24.
//

import SwiftUI

struct DequeDetailView: View {
    var character: FranchiseCharacter
    var body: some View {
        ScrollView {
            VStack {
                if let imageUrl = character.image?.originalUrl {
                    AsyncImage(
                        url: URL(string: imageUrl),
                        content: { image in
                            image.resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: 300, maxHeight: 300)
                                .mask(RoundedRectangle(cornerRadius: 10)
                                    .frame(maxWidth: 300, maxHeight: 300))
                        },
                        placeholder: {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundStyle(.gray)
                                .frame(maxWidth: 300, maxHeight: 300)
                        }
                    )
                }
            }
            Text(character.name!)
                .font(.largeTitle)
            if let realName = character.realName {
                Text("Real Name:")
                Text(realName)
            }
            if let aliases = character.aliases {
                Text("Known Aliases:")
                Text(character.formattedAliases)
            }
            if let description = character.description {
                VStack(spacing: 10) {
                    Text("Description:")
                    Text(description.htmlToString())
                }
            }
        }
        .padding()
    }
}

//#Preview {
//    DequeDetailView()
//}
