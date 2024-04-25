//
//  LoadingState.swift
//  Deque
//
//  Created by Adrian Eves on 4/25/24.
//

import Foundation

// Manages the state of the networking process.
enum LoadingState {
    ///  The data is still loading.
    case loading
    case loaded // The data has loaded.
    case failed // The data has failed to load.
    
    #warning("return here for the triple slashing")
}
