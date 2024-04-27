//
//  ReleaseTogglesViewModel.swift
//  Grocshare
//
//  Created by Jaydev Trivedi on 16/3/2024.
//

import Foundation

class ReleaseTogglesViewModel: ObservableObject {
    @Published var releaseToggles: ReleaseToggles?
    
    private var releaseTogglesService: ReleaseTogglesService
    
    init(releaseTogglesService: ReleaseTogglesService = ReleaseTogglesService()) {
        self.releaseTogglesService = releaseTogglesService
    }
    
    func getReleaseToggles() {
        releaseTogglesService.getReleaseToggles { [weak self] releaseToggles in
            DispatchQueue.main.async {
                self?.releaseToggles = releaseToggles
                print("Release Toggles: \(String(describing: self?.releaseToggles))")
            }
        }
    }
}
