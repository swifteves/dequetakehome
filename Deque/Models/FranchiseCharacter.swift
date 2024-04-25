//
//  Characters.swift
//  Deque
//
//  Created by Adrian Eves on 4/25/24.
//

import Foundation

struct ResultsContainer: Codable {
    var error: String?
    var limit: Int?
    var offset: Int?
    var numberOfPageResults: Int?
    var numberOfTotalResults: Int?
    var statusCode: Int?
    var results: [FranchiseCharacter]?
}

struct FranchiseCharacter: Codable, Hashable {
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
    
    var formattedAliases: String {
        if let aliases = aliases {
            let aliasCollection = aliases.components(separatedBy: .newlines).filter {
                $0.trimmingCharacters(in: .whitespacesAndNewlines) != ""
            }
            return aliasCollection.formatted(.list(type: .and))
        }
        
        return ""
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(id)
    }
}

struct CharacterImage: Codable {
    var iconUrl: String?
    var mediumUrl: String?
    var screenUrl: String?
    var screenLargeUrl: String?
    var smallUrl: String?
    var superUrl: String?
    var thumbUrl: String?
    var tinyUrl: String?
    var originalUrl: String?
    var imageTags: String?
}
