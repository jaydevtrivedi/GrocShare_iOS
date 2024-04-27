//
//  ReleaseTogglesViewUITests.swift
//  GrocshareUITests
//
//  Created by Jaydev Trivedi on 25/3/2024.
//

import XCTest

final class ReleaseTogglesViewUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        let app = XCUIApplication()
        app.launchArguments.append("--uitesting")
        app.launch()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testReleaseTogglesView() throws {
        let app = XCUIApplication()
        
        // Check for the loading state, if applicable
        //XCTAssertTrue(app.staticTexts["Loading..."].exists)
        
        // Wait for the loading to disappear and toggles to appear
        let signInText = app.staticTexts["Allow Sign In: Yes"]
        let settingsText = app.staticTexts["Allow Settings: No"]
        
        let existsPredicate = NSPredicate(format: "exists == true")
        
        expectation(for: existsPredicate, evaluatedWith: signInText, handler: nil)
        expectation(for: existsPredicate, evaluatedWith: settingsText, handler: nil)
        
        waitForExpectations(timeout: 5, handler: nil)
        
        XCTAssertTrue(signInText.exists)
        XCTAssertTrue(settingsText.exists)
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
