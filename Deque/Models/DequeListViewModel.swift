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
    var charactersList = [FranchiseCharacter]()
    var loadingState = LoadingState.loading
    
    init(network: FetchNetwork) {
        self.network = network
    }
    
    func retrieveCharacters() async {
        if let results: ResultsContainer? = await network.getData(url: "https://www.giantbomb.com/api/characters/?api_key=ea98adc584efb356fcd14b949f8a9f2aa2b270b8&format=json") {
            if let characters = results?.results {
                //charactersList = characters
                for character in characters {
                    if character.name != nil {
                        charactersList.append(character)
                    }
                }
                loadingState = .loaded
            }
        } else {
            loadingState = .failed
        }
    }
    
    
}
