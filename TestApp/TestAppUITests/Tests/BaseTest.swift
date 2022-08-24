//
//  TestAppUITests.swift
//  TestAppUITests
//
//  Created by IL on 24.08.2022.
//

import XCTest

class BaseTest: XCTestCase {
    var app: XCUIApplication!

    override func setUp() {
        continueAfterFailure = false
        app = XCUIApplication(bundleIdentifier: "com.apple.mobileslideshow")
        app.launch()
    }

    override func tearDown() {
        app.terminate()
    }
}
