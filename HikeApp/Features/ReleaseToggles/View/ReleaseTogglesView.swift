//
//  ReleaseTogglesView.swift
//  HikeApp
//
//  Created by Jaydev Trivedi on 16/3/2024.
//

import SwiftUI

struct UserListView: View {
    @ObservedObject var viewModel = ReleaseTogglesViewModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            if let releaseToggles = viewModel.releaseToggles {
                Text("Allow Sign In: \(releaseToggles.allowHomePage ? "Yes" : "No")")
                    .font(.headline)
                Text("Allow Settings: \(releaseToggles.allowSettings ? "Yes" : "No")")
                    .font(.subheadline)
            } else {
                Text("Loading...")
                    .font(.headline)
            }
        }
        .onAppear {
            viewModel.fetchUsers()
        }
    }
}

#Preview {
    UserListView()
}
