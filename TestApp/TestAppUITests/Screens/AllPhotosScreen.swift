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
    
    /**
     Returns the visibility of the onboarding popover
     - Returns: true if onboarding popover exists
     */
    private func onboardingPopoverIsShown() -> Bool {
        onboardingContinueButton.waitForExistence(timeout: 2)
    }
    
    /**
     This method checks for an onboarding popover and presses the Continue button if a popover exists
     */
    func passOnboarding() {
        if onboardingPopoverIsShown() {
            onboardingContinueButton.tap()
        }
    }
    
    /**
     Removes the photo by its index. IMPORTANT: Index start's with 0
     - Parameter index: index of the photo to delete, 0 is the first one
     */
    func removePhotoWithLongTap(index: Int) {
        // I was thinking about adding a check for index to avoid index out of range,
        // but since tests are controlled env I've skipped it
        allPhotos.element(boundBy: index).press(forDuration: 3)
        deleteFromLibraryButton.waitAndTap()
        deletionConfirmation.waitAndTap()
    }
    
    /**
     Opens the photo by its index. IMPORTANT: Index start's with 0
     - Parameter index: index of the photo to open, 0 is the first one
     */
    func openPhotoByIndex(_ index: Int) {
        allPhotos.element(boundBy: index).tap()
    }
    
    /**
     Returns the number of all visible photos on the screen
     - Returns: number of photos
     */
    func getNumberOfPhotos() -> Int {
        allPhotos.count
    }
    
    /**
     Delete opened image and go back to the images thumbnails list
     */
    func deletoPhotoFromPhotoDetailsView() {
        photoViewDeleteButton.waitAndTap()
        deletionConfirmation.waitAndTap()
        if UIDevice.current.userInterfaceIdiom == .pad {
            backButton.waitAndTap()
        } else {
            iphoneAllPhotosButton.waitAndTap()
        }
    }
    
    /**
     Returns the text description of the opened photo
     - Returns: text of the photo label
     */
    func getImageDescriptionFromDetailView() -> String {
        app.images.firstMatch.label
    }
    
    /**
     Search for the image with specified label text
     - Parameter description: text to search
     */
    func imageWithDescriptionExists(description: String) -> Bool {
        app.cells[description].waitForExistence(timeout: 2)
    }
    
    /**
     Returns the text description of the photo in the thumbnails list
     - Parameter index: index of the photo to get the text from
     - Returns: text of the photo label
     */
    func getPhotoDescriptionByIndex(_ index: Int) -> String {
        allPhotos.element(boundBy: index).label
    }
    
    /**
     This method goes to the recently deleted screen and restores all deleted photos
     */
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
