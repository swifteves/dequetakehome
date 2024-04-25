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
                                .mask(RoundedRectangle(cornerRadius: 10, style: .circular)
                                    .frame(maxWidth: 300, maxHeight: 300))
                        },
                        placeholder: {
                            RoundedRectangle(cornerRadius: 10, style: .circular)
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
                let aliasCollection = aliases.components(separatedBy: .newlines).filter {
                    $0.trimmingCharacters(in: .whitespacesAndNewlines) != ""
                }
                Text("Known Aliases:")
                Text(aliasCollection.joined(separator: ", "))
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


// Taken from: https://forums.developer.apple.com/forums/thread/677823
extension String {
    func htmlToString() -> String {
        return  try! NSAttributedString(data: self.data(using: .utf8)!,
                                        options: [.documentType: NSAttributedString.DocumentType.html],
                                        documentAttributes: nil).string
    }
}
