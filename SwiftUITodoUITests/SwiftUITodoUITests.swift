//
//  SwiftUITodoUITests.swift
//  SwiftUITodoUITests
//
//  Created by Fabio Soares on 22/03/21.
//  Copyright © 2021 Suyeol Jeon. All rights reserved.
//

import XCTest

class SwiftUITodoUITests: SwiftUITodoBase {
    
    func testCreateANewTask() {

        app.tables.textFields["Create a New Task..."].tap()
        app.tables.textFields["Create a New Task..."].typeText("New task")
        app.buttons["Return"].tap()
        XCTAssertTrue(app.tables.buttons["New task"].exists)
        
        // Delete task created
        app.navigationBars["Tasks 👀"].buttons["Edit"].tap()
        XCTAssertTrue(app.tables.cells.otherElements.containing(.button, identifier:"New task").images["deleteButton"].waitForExistence(timeout: 10))
        app.tables.cells.otherElements.containing(.button, identifier:"New task").images["deleteButton"].tap()
        app.navigationBars["Tasks 👀"].buttons["Done"].tap()
    }
    
    func testDeleteExistingTask() {
        
        // Create a new task
        app.tables.textFields["Create a New Task..."].tap()
        app.tables.textFields["Create a New Task..."].typeText("New task")
        app.buttons["Return"].tap()
        XCTAssertTrue(app.tables.buttons["New task"].exists)
        
        // Delete task created
        app.navigationBars["Tasks 👀"].buttons["Edit"].tap()
        XCTAssertTrue(app.tables.cells.otherElements.containing(.button, identifier:"New task").images["deleteButton"].waitForExistence(timeout: 10))
        app.tables.cells.otherElements.containing(.button, identifier:"New task").images["deleteButton"].tap()
        app.navigationBars["Tasks 👀"].buttons["Done"].tap()
                
        // Assert task was deleted
        XCTAssertFalse(app.tables.buttons["New task"].exists)
    }
    
    func testMarkTaskAsCompleted() {
        
        // Create a new task
        app.tables.textFields["Create a New Task..."].tap()
        app.tables.textFields["Create a New Task..."].typeText("New task")
        app.buttons["Return"].tap()
        XCTAssertTrue(app.tables.buttons["New task"].exists)
        
        // Mark task as completed
        let cell = app.tables.children(matching: .cell).element(boundBy: 1)
        cell.buttons["New task"].tap()
        
        XCTAssertTrue(app.tables.containing(.button, identifier:"New task").images["checkmark"].exists)
        
        // Delete task created
        app.navigationBars["Tasks 👀"].buttons["Edit"].tap()
        XCTAssertTrue(app.tables.cells.otherElements.containing(.button, identifier:"New task").images["deleteButton"].waitForExistence(timeout: 10))
        app.tables.cells.otherElements.containing(.button, identifier:"New task").images["deleteButton"].tap()
        app.navigationBars["Tasks 👀"].buttons["Done"].tap()
                
        // Assert task was deleted
        XCTAssertFalse(app.tables.buttons["New task"].exists)
    }
}
