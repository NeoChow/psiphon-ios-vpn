/*
 * Copyright (c) 2017, Psiphon Inc.
 * All rights reserved.
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 */


import XCTest

class PsiphonUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        let app = XCUIApplication()

        var launchEnv = app.launchEnvironment
        launchEnv["PsiphonUITestEnvironment"] = "State:Connected"
        app.launchEnvironment = launchEnv

        setupSnapshot(app)

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGenerateScreenshots() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        snapshot("main")
        XCUIApplication().buttons["settings"].tap()
        snapshot("settings")
        XCUIApplication().cells.element(boundBy: 1).tap() // Region
        snapshot("settings-region")
        XCUIApplication().navigationBars.buttons.element(boundBy: 0).tap()
        XCUIApplication().cells.element(boundBy: 2).tap() // Language
        snapshot("settings-language")
        XCUIApplication().navigationBars.buttons.element(boundBy: 0).tap()
    }
}
