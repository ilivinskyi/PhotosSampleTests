//
//  XCTest+Extension.swift
//  TestAppUITests
//
//  Created by IL on 24.08.2022.
//

import XCTest

extension XCUIElement {
    
    /**
     Wait 5 seconds for element to appear and then tap it
     */
    func waitAndTap() {
        guard self.waitForExistence(timeout: 5) else {
            XCTFail("\(self.description) is not visible or can't be tapped")
            return
        }
        self.tap()
    }
}


