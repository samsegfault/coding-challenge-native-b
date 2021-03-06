//
//  Osheaga_Routes_SwiftUITests.swift
//  Osheaga Routes SwiftUITests
//
//  Created by user on 01/11/20.
//

import XCTest

class OnboardingUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCompleteOnboardingWithSwipes() throws {
        
        let app = XCUIApplication()
        app.launch()

        let element = app.collectionViews.cells.children(matching: .other).element
        
        element.swipeLeft()
        element.swipeLeft()
        
        _ = app.buttons["LET'S GO"].waitForExistence(timeout: 5)
        app.buttons["LET'S GO"].tap()
        
        XCTAssertFalse(app.buttons["LET'S GO"].waitForExistence(timeout: 5))
        
    }
    
    func testCompleteOnboardingWithTaps() throws {
        
        let app = XCUIApplication()
        app.launch()

        _ = app.buttons["ic next arrow"].waitForExistence(timeout: 5)
        app.buttons["ic next arrow"].tap()
        app.buttons["ic next arrow"].tap()
        
        _ = app.buttons["LET'S GO"].waitForExistence(timeout: 5)
        app.buttons["LET'S GO"].tap()
        
        XCTAssertFalse(app.buttons["LET'S GO"].waitForExistence(timeout: 5))
        
    }
    
    
    func testCompleteOnboardingStartToEndToStartToEnd() throws {
        
        let app = XCUIApplication()
        app.launch()

        let element = app.collectionViews.cells.children(matching: .other).element
        
        element.swipeLeft()
        element.swipeLeft()
        
        element.swipeRight()
        element.swipeRight()
        
        _ = app.buttons["ic next arrow"].waitForExistence(timeout: 5)
        app.buttons["ic next arrow"].tap()
        app.buttons["ic next arrow"].tap()
        
        _ = app.buttons["LET'S GO"].waitForExistence(timeout: 5)
        app.buttons["LET'S GO"].tap()
        
        XCTAssertFalse(app.buttons["LET'S GO"].waitForExistence(timeout: 5))
        
    }
    
    func testCompleteOnboardingStressSwiping() throws {
        
        let app = XCUIApplication()
        app.launch()

        let element = app.collectionViews.cells.children(matching: .other).element
        
        element.swipeLeft()
        element.swipeRight()
        
        element.swipeLeft()
        element.swipeRight()
        
        element.swipeLeft()
        element.swipeRight()
        
        element.swipeLeft()
        element.swipeRight()
        
        element.swipeLeft()
        element.swipeRight()
        
        _ = app.buttons["ic next arrow"].waitForExistence(timeout: 5)
        
        app.buttons["ic next arrow"].tap()
        app.buttons["ic next arrow"].tap()
        
        _ = app.buttons["LET'S GO"].waitForExistence(timeout: 5)
        app.buttons["LET'S GO"].tap()
        
        XCTAssertFalse(app.buttons["LET'S GO"].waitForExistence(timeout: 5))
        
    }
    
    func testDismissOnboardingWithSwipe() throws {
        
        let app = XCUIApplication()
        app.launch()

        let element = app.collectionViews.cells.children(matching: .other).element
        element.swipeDown()
        
        XCTAssertFalse(app.buttons["ic next arrow"].waitForExistence(timeout: 5))
    }
    
    
    

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
