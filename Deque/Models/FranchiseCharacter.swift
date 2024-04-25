//
//  Characters.swift
//  Deque
//
//  Created by Adrian Eves on 4/25/24.
//

import Foundation

struct FranchiseCharacter: Decodable, Hashable, Identifiable {
    static func == (lhs: FranchiseCharacter, rhs: FranchiseCharacter) -> Bool {
        lhs.name == rhs.name && lhs.id == rhs.id
    }
    
    var aliases: String?
    var apiDetailUrl: String?
    var description: String?
    var guid: String?
    var id: Int?
    var image: CharacterImage?
    var lastName: String?
    var name: String
    var realName: String?
    var siteDetailUrl: String?
    
    var aliasList: [String] {
        if let aliases {
            aliases.components(separatedBy: .newlines).filter {
                !$0.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
            }
        } else {
            []
        }
    }
    
    var formattedAliases: String {
        if !aliasList.isEmpty {
            aliasList.formatted(.list(type: .and))
        } else {
            ""
        }
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(id)
    }
}
