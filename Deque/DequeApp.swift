//
//  DequeApp.swift
//  Deque
//
//  Created by Adrian Eves on 4/22/24.
//

import SwiftUI

@main
struct DequeApp: App {
    init() {
        #if DEBUG
        if CommandLine.arguments.contains("isRunningUITests") {
            
        }
        #endif
    }
    var body: some Scene {
        WindowGroup {
            DequeView()
        }
    }
}
