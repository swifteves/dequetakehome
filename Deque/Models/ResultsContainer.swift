//
//  ResultsContainer.swift
//  Deque
//
//  Created by Adrian Eves on 4/25/24.
//

import Foundation

struct ResultsContainer: Decodable {
    var error: String?
    var limit: Int?
    var offset: Int?
    var numberOfPageResults: Int?
    var numberOfTotalResults: Int?
    var statusCode: Int?
    var results: [FranchiseCharacter]?
}
