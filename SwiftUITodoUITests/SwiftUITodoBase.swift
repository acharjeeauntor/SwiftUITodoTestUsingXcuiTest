//
//  SwiftUITodoBase.swift
//  SwiftUITodoUITests
//
//  Created by Fabio Soares on 22/03/21.
//  Copyright © 2021 Suyeol Jeon. All rights reserved.
//

import XCTest

class SwiftUITodoBase: XCTestCase {
    
    let app = XCUIApplication()

    override func setUpWithError() throws {
        super.setUp()
        continueAfterFailure = false
        app.launch()
        
    }

    override func tearDownWithError() throws {
        app.terminate()
    }

}
