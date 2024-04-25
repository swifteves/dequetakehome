//
//  Characters.swift
//  Deque
//
//  Created by Adrian Eves on 4/25/24.
//

import Foundation

struct ResultsContainer: Codable {
    var error: String?
    var limit: Int
    var offset: Int
    var numberOfPageResults: Int
    var numberOfTotalResults: Int
    var statusCode: Int
    var results: [Characters]
}

struct Characters: Codable {
    var aliases: String
    var apiDetailUrl: String
    var birthday: String
    var dateAdded: String
    var dateLastUpdated: String
    var deck: String
    var description: String
    var firstAppearedInGame: String
    var gender: String
    var guid: String
    var id: String
    var image: String
    var imageTags: String
    var lastName: String
    var name: String
    var realName: String
    var siteDetailUr: String
}
