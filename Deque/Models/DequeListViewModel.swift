//
//  DequeListViewModel.swift
//  Deque
//
//  Created by Adrian Eves on 4/25/24.
//

import Foundation
import Observation

@Observable
class DequeListViewModel {
    let network: FetchNetwork
    var charactersList = [Characters]()
    
    init(network: FetchNetwork) {
        self.network = network
    }
    
    func retrieveCharacters() {
        Task {
            if let results: Characters? = await network.getData(url: "people") {
                // TODO: do something with your characters
            }
        }
    }
}
