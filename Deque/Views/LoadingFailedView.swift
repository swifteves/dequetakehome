//
//  LoadingFailedView.swift
//  Deque
//
//  Created by Adrian Eves on 4/25/24.
//

import SwiftUI

struct LoadingFailedView: View {
    var body: some View {
        VStack {
            ContentUnavailableView {
                Label("No Results", systemImage: "tray.fill")
            } description: {
                Text("Unable to retrieve data.")
            }
        }
    }
}

#Preview {
    LoadingFailedView()
}
