//
//  LoadingView.swift
//  Deque
//
//  Created by Adrian Eves on 4/25/24.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
                .accessibilityHidden(true)
            Text("Loading...")
        }
    }
}

#Preview {
    LoadingView()
}
