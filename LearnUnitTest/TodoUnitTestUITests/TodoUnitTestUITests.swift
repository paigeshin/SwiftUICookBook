//
//  TodoUnitTestUITests.swift
//  TodoUnitTestUITests
//
//  Created by Mohammad Azam on 9/11/21.
//

import XCTest

class setup_launching_add_new_task_screen: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() {
        app = XCUIApplication()
        app.launch()
        
        let addTaskButton = app.buttons["showAddTaskButton"]
        addTaskButton.tap()
    }
    
}

class when_add_new_task_screen_is_presented: setup_launching_add_new_task_screen {
    
    func test_should_make_sure_screen_is_displayed() {
       
        let addTaskNavBarTitle = app.staticTexts["Add Task"]
        XCTAssert(addTaskNavBarTitle.waitForExistence(timeout: 0.5))
        
    }
    
    func test_should_make_sure_all_required_controls_are_present() {
        
        XCTAssertTrue(app.textFields["addTaskTextField"].exists)
        XCTAssertTrue(app.buttons["showAddTaskButton"].exists)
    }
    
    func test_should_dismiss_modal_after_adding_new_task() {
        
        let taskTextField = app.textFields["addTaskTextField"]
        taskTextField.tap()
        taskTextField.typeText("Wash the car")
        
        let addTaskButton = app.buttons["addTaskButton"]
        addTaskButton.tap()
        
        XCTAssertFalse(addTaskButton.waitForExistence(timeout: 0.5))
    }
    
}


class when_adding_new_task: setup_launching_add_new_task_screen {
    
    func test_should_display_new_task_in_the_list() {
        
        let taskTextField = app.textFields["addTaskTextField"]
        taskTextField.tap()
        taskTextField.typeText("Wash car")
        let addTaskButton = app.buttons["addTaskButton"]
        addTaskButton.tap()
        XCTAssertFalse(addTaskButton.waitForExistence(timeout: 0.5))
        
        let taskList = app.tables["taskList"]
        let _ = taskList.waitForExistence(timeout: 0.5)
        
        let totalTaskItems = taskList.descendants(matching: .staticText).count
        XCTAssertEqual(1, totalTaskItems)
    }
    
}
