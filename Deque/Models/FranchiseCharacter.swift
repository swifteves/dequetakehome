//
//  Characters.swift
//  Deque
//
//  Created by Adrian Eves on 4/25/24.
//

import Foundation

struct FranchiseCharacter: Decodable, Hashable, Identifiable {
    static func == (lhs: FranchiseCharacter, rhs: FranchiseCharacter) -> Bool {
        return lhs.name == rhs.name && lhs.id == rhs.id
    }
    
    var aliases: String?
    var apiDetailUrl: String?
    var birthday: String?
    var dateAdded: String?
    var dateLastUpdated: String?
    var deck: String?
    var description: String?
    var gender: Int?
    var guid: String?
    var id: Int?
    var image: CharacterImage?
    var lastName: String?
    var name: String?
    var realName: String?
    var siteDetailUrl: String?
    
    var aliasList: [String] {
        guard let aliases = aliases else {
            return []
        }
        
        return aliases.components(separatedBy: .newlines).filter {
            $0.trimmingCharacters(in: .whitespacesAndNewlines) != ""
        }
    }
    
    var formattedAliases: String {
        guard !aliasList.isEmpty else {
            return ""
        }
        
        return aliasList.formatted(.list(type: .and))
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(id)
    }
}
