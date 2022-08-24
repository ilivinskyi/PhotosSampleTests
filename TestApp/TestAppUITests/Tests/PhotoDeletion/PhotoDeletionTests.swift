//
//  PhotoDeletionTests.swift
//  TestAppUITests
//
//  Created by IL on 24.08.2022.
//

import XCTest

class PhotoDeletionTests: BaseTest {
    private var baseScreen = BaseScreen()
    private var photosScreen = AllPhotosScreen()
    
    override func setUp() {
        super.setUp()
        baseScreen.allowNotifications()
        photosScreen.passOnboarding()
        addTeardownBlock {
            self.photosScreen.restoreRemovedPhotos()
        }
    }
    
    func testRemovePhotoWithLongTap() {
        let numberOfPhotosBefore = photosScreen.getNumberOfPhotos()
        let description = photosScreen.getPhotoDescriptionByIndex(1)
        photosScreen.removePhotoWithLongTap(index: 1)
        let numberOfPhotosAfter = photosScreen.getNumberOfPhotos()
        let photoWithDescriptionExists = photosScreen.imageWithDescriptionExists(description: description)
        XCTAssertNotEqual(numberOfPhotosBefore, numberOfPhotosAfter, "Number of photos hasn't changed.")
        XCTAssertFalse(photoWithDescriptionExists, "Photo with description \(description) was not removed")
}
    
    func testRemovePhotoFromPhotoView() {
        photosScreen.openPhotoByIndex(1)
        let description = photosScreen.getImageDescriptionFromDetailView()
        photosScreen.deletoPhotoFromPhotoDetailsView()
        let photoWithDescriptionExists = photosScreen.imageWithDescriptionExists(description: description)
        XCTAssertFalse(photoWithDescriptionExists, "Photo with description \(description) was not removed")
    }
}
