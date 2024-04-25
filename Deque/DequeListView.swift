//
//  ContentView.swift
//  Deque
//
//  Created by Adrian Eves on 4/22/24.
//

import SwiftUI

struct DequeListView: View {
    //@State private var viewModel = DessertListViewModel()
    var body: some View {
        NavigationStack {
            List {
                // TODO: ForEach
                Text("Hi")
            }
            .navigationTitle("Deque Take-Home")
        }
    }
}

#Preview {
    DequeListView()
}
