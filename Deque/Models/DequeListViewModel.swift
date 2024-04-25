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
    
    func retrieveCharacters() async {
        if let results: [Characters]? = await network.getData(url: "https://www.giantbomb.com/api/characters/?api_key=ea98adc584efb356fcd14b949f8a9f2aa2b270b8") {
            // TODO: do something with your characters
        }
    }
    
    
}
