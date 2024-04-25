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
            Text("Unable to fetch data.")
                .font(.largeTitle)
            Text("Please try again later.")
        }
    }
}

#Preview {
    LoadingFailedView()
}
