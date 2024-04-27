//
//  ReleaseTogglesViewModel.swift
//  HikeApp
//
//  Created by Jaydev Trivedi on 16/3/2024.
//

import Foundation


struct ReleaseToggles: Identifiable, Codable {
    var id: Int
    var allowSignIn: Bool
    var allowHomePage: Bool
    var allowSettings: Bool
}
