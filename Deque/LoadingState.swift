//
//  LoadingState.swift
//  Deque
//
//  Created by Adrian Eves on 4/25/24.
//

import Foundation

// Manages the state of the networking process.
enum LoadingState {
    case loading // The data is still loading.
    case loaded // The data has loaded.
    case failed // The data has failed to load.
}
