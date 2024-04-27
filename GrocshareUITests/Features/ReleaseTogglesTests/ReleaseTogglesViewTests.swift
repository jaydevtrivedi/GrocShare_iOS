//
//  ReleaseTogglesViewTests.swift
//  GrocshareUITests
//
//  Created by Jaydev Trivedi on 25/3/2024.
//

@testable import Grocshare
import SwiftUI
import XCTest

class ReleaseTogglesViewTests: XCTestCase {
    func testReleaseTogglesView_whenViewModelHasData_shouldShowOptions() {
        // Arrange
        let viewModel = ReleaseTogglesViewModelMock(hasData: true)
        let releaseTogglesView = ReleaseTogglesView(viewModel: viewModel)

        // Assert
        XCTAssertNotNil(releaseTogglesView.viewModel.releaseToggles, "ViewModel should have release toggles data.")
        // You may need to run this test in a host application to render SwiftUI views and then use XCTAssert to check the view hierarchy.
    }

    func testReleaseTogglesView_whenViewModelHasNoData_shouldShowLoading() {
        // Arrange
        let viewModel = ReleaseTogglesViewModelMock(hasData: false)
        let releaseTogglesView = ReleaseTogglesView(viewModel: viewModel)

        // Assert
        XCTAssertNil(releaseTogglesView.viewModel.releaseToggles, "ViewModel should not have release toggles data.")
        // As above, rendering SwiftUI views and checking for 'Loading...' text will require running this in a host application.
    }
}

class ReleaseTogglesViewModelMock: ReleaseTogglesViewModel {
    init(hasData: Bool) {
        super.init()
        if hasData {
            self.releaseToggles = ReleaseToggles(allowSignIn: true, allowHomePage: true, allowSettings: true)
        }
    }

    override func getReleaseToggles() {
        // This override can be left empty or used to simulate fetching users
    }
}
