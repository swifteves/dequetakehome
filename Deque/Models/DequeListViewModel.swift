//
//  DequeListViewModel.swift
//  Deque
//
//  Created by Adrian Eves on 4/25/24.
//

import Foundation

@Observable
class DequeListViewModel {
    var charactersList = [FranchiseCharacter]()
    var loadingState = LoadingState.loading
    var searchText = ""
    
    var filteredCharacters: [FranchiseCharacter] {
        charactersList.filter {
            $0.name.localizedStandardContains(searchText)
        }
    }
    
    func retrieveCharacters() async {
        #if DEBUG
        if CommandLine.arguments.contains("weofewhcouwfh") {
            // Make objects
            
            return
        }
        #endif
        do {
            #warning("This name sucks")
            let results = try await Network.fetch(.characters)
            charactersList = results.results
            loadingState = .loaded
        } catch {
            loadingState = .failed
        }
    }
}
