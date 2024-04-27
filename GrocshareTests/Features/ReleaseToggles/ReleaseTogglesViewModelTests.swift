//
//  ReleaseTogglesViewModelTests.swift
//  GrocshareTests
//
//  Created by Jaydev Trivedi on 25/3/2024.
//

@testable import Grocshare
import XCTest

class ReleaseTogglesViewModelTests: XCTestCase {
    
    func testFetchUsersSuccess() {
        let service = MockReleaseTogglesService(shouldReturnError: false)
        let viewModel = ReleaseTogglesViewModel(releaseTogglesService: service)
        let expectation = XCTestExpectation(description: "Fetch users succeeds and updates releaseToggles")
        
        viewModel.getReleaseToggles()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            if viewModel.releaseToggles != nil {
                expectation.fulfill()
            }
            
            self.wait(for: [expectation], timeout: 1.1)
        }
    }
    
    func testFetchUsersFailure() {
        let service = MockReleaseTogglesService(shouldReturnError: true)
        let viewModel = ReleaseTogglesViewModel(releaseTogglesService: service)
        let expectation = XCTestExpectation(description: "Fetch users fails and releaseToggles remains nil")
        
        viewModel.getReleaseToggles()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            if viewModel.releaseToggles == nil {
                expectation.fulfill()
            }
            
            self.wait(for: [expectation], timeout: 1.1)
        }
    }
    
    // Mock service that conforms to ReleaseTogglesService protocol
    class MockReleaseTogglesService: ReleaseTogglesService {
        var shouldReturnError: Bool
        
        init(shouldReturnError: Bool) {
            self.shouldReturnError = shouldReturnError
        }
        
        override func getReleaseToggles(completion: @escaping (ReleaseToggles?) -> Void) {
            if shouldReturnError {
                completion(nil)
            } else {
                completion(ReleaseToggles(allowSignIn: true, allowHomePage: true, allowSettings: true))
            }
        }
    }
}

