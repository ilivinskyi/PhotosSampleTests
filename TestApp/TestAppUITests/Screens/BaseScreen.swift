//
//  BaseScreen.swift
//  TestAppUITests
//
//  Created by IL on 24.08.2022.
//

import XCTest

class BaseScreen {
    let app = XCUIApplication(bundleIdentifier: "com.apple.mobileslideshow")
    private lazy var springboard = XCUIApplication(bundleIdentifier: "com.apple.springboard")
    private lazy var alertAllowButton = springboard.alerts.buttons.element(boundBy: 1)
    private lazy var alertDontAllowButton = springboard.alerts.buttons.element(boundBy: 0)
    
    private func alertExist() -> Bool {
        springboard.alerts.element.waitForExistence(timeout: 2)
    }
    
    func allowNotifications() {
        if alertExist() {
            alertAllowButton.tap()
        }
    }
    
    func forbidNotifications() {
        if alertExist() {
            alertDontAllowButton.tap()
        }
    }
}
