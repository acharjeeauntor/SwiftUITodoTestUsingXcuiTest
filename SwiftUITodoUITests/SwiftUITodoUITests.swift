//
//  SwiftUITodoUITests.swift
//  SwiftUITodoUITests
//
//  Created by Fabio Soares on 22/03/21.
//  Copyright © 2021 Suyeol Jeon. All rights reserved.
//

import XCTest

class SwiftUITodoUITests: SwiftUITodoBase {
    func testCreateANewTask(){
        let inputField =  app.tables/*@START_MENU_TOKEN@*/.textFields["Create a New Task..."]/*[[".cells[\"Create a New Task...\"].textFields[\"Create a New Task...\"]",".textFields[\"Create a New Task...\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        inputField.tap()
        inputField.typeText("Auntor Acharja")
        app/*@START_MENU_TOKEN@*/.buttons["Return"]/*[[".keyboards",".buttons[\"return\"]",".buttons[\"Return\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        XCTAssert(app.tables.buttons["Auntor Acharja"].exists)
    }
}
