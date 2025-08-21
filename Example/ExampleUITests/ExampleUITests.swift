import XCTest

@MainActor final class ExampleUITests: XCTestCase {
    override func setUp() {
        launch()
    }

    override func tearDown() {
        terminate()
    }

    func test_list_view() {
        screenshot(name: "List View")

        XCTAssertEqual(app.navigationBars.element.identifier, "Tests")
        XCTAssertTrue(app.staticTexts["Missing Value"].exists)
        XCTAssertTrue(app.staticTexts["Present Value"].exists)
    }

    func test_missing_view() {
        app.buttons["Missing Value"].tap()

        screenshot(name: "Missing View")

        XCTAssertEqual(app.navigationBars.element.identifier, "Missing Value")
//        XCTAssertTrue(app.staticTexts["Fatal Error"].exists)
//        XCTAssertTrue(app.staticTexts["No builder for symbol: MissingPlaceholder"].exists)
    }

    func test_present_view() {
        app.buttons["Present Value"].tap()

        screenshot(name: "Present View")

        XCTAssertEqual(app.navigationBars.element.identifier, "Present Value")
        XCTAssertTrue(app.staticTexts["present 42 present"].exists)
    }

    // MARK: -

    private var app: XCUIApplication!

    private func launch() {
        app = XCUIApplication()
        app.launchArguments = ["--ui-tests"]
        app.launch()
    }

    private func terminate() {
        app.terminate()
        app = nil
    }

    private func screenshot(name: String) {
        let screenshot = app.screenshot()
        let attachment = XCTAttachment(screenshot: screenshot)
        attachment.name = name
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
