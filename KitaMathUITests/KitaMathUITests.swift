//
//  KitaMathUITests.swift
//  KitaMathUITests
//
//  Created by AIA-Chris on 08/05/19.
//  Copyright © 2019 Chrizers. All rights reserved.
//

import XCTest

class KitaMathUITests: XCTestCase {

    var app:XCUIApplication!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        app = XCUIApplication()
        
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app.launchArguments.append("--uitesting")

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        app = nil
    }

    func testShowingListContent() {
        app.launch()
        XCTAssertTrue(app.isDisplayingContentList)
        
        let myTable = app.tables.containing(.table, identifier: "tableContents")
        let cell = myTable.cells.allElementsBoundByIndex.first
        let card = cell?.otherElements["card"]
        cell?.tap()
    }
    
    func testTableView() {
        
    }
}

extension XCUIApplication {
    var isDisplayingContentList: Bool {
        return otherElements["contentlist"].exists
    }
}
