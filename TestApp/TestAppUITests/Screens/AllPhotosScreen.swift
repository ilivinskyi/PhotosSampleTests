//
//  AllPhotosScreen.swift
//  TestAppUITests
//
//  Created by IL on 24.08.2022.
//

import XCTest

class AllPhotosScreen: BaseScreen {
    private lazy var onboardingContinueButton = app.buttons["Continue"]
    private lazy var allPhotos = app.collectionViews.cells
    private lazy var deleteFromLibraryButton = app.buttons["Delete from Library"]
    private lazy var deletionConfirmation = app.buttons["Delete Photo"]
    private lazy var backButton = app.buttons["BackButton"]
    private lazy var recentlyDeleted = app.buttons["Recently Deleted"]
    private lazy var navBarSelectButton = app.buttons["Select"]
    private lazy var recoverAllButton = app.buttons["Recover All"]
    private lazy var photoViewDeleteButton = app.buttons["Delete"]
    private lazy var recoverAllConfirmationButton = app.buttons.element(boundBy: 4)
    private lazy var iPhoneRecoverAllConfirmationButton = app.buttons.element(boundBy: 3)
    private lazy var iphoneAlbumsButton = app.buttons["Albums"]
    private lazy var iphoneAllPhotosButton = app.buttons["All Photos"]
    private lazy var iphoneRecentlyDeleted = app.staticTexts["Recently Deleted"]
    
    private func onboardingScreenIsShown() -> Bool {
        onboardingContinueButton.waitForExistence(timeout: 2)
    }
    
    func passOnboarding() {
        if onboardingScreenIsShown() {
            onboardingContinueButton.tap()
        }
    }
    
    /**
     Removes photo by it's index. IMPORTANT: Index start's with 0
     - Parameter index: index of the photo to delete, 0 is the first one
     */
    func removePhotoWithLongTap(index: Int) {
        allPhotos.element(boundBy: index).press(forDuration: 3)
        deleteFromLibraryButton.waitAndTap()
        deletionConfirmation.waitAndTap()
    }
    
    func openPhotoByIndex(_ index: Int) {
        allPhotos.element(boundBy: index).tap()
    }
    
    func getNumberOfPhotos() -> Int {
        allPhotos.count
    }
    
    func deletoPhotoFromPhotoDetailsView() {
        photoViewDeleteButton.waitAndTap()
        deletionConfirmation.waitAndTap()
        if UIDevice.current.userInterfaceIdiom == .pad {
            backButton.waitAndTap()
        } else {
            iphoneAllPhotosButton.waitAndTap()
        }
    }
    
    func getImageDescriptionFromDetailView() -> String {
        app.images.firstMatch.label
    }
    
    func imageWithDescriptionExists(description: String) -> Bool {
        app.cells[description].waitForExistence(timeout: 2)
    }
    
    func getPhotoDescriptionByIndex(_ index: Int) -> String {
        allPhotos.element(boundBy: index).label
    }
    
    func restoreRemovedPhotos() {
        if UIDevice.current.userInterfaceIdiom == .pad {
            backButton.waitAndTap()
            recentlyDeleted.waitAndTap()
            navBarSelectButton.waitAndTap()
            recoverAllButton.waitAndTap()
            recoverAllConfirmationButton.waitAndTap()
        } else {
            iphoneAlbumsButton.waitAndTap()
            app.swipeUp()
            iphoneRecentlyDeleted.waitAndTap()
            navBarSelectButton.waitAndTap()
            recoverAllButton.waitAndTap()
            iPhoneRecoverAllConfirmationButton.waitAndTap()
            iphoneAllPhotosButton.waitAndTap()
        }
    }
}
