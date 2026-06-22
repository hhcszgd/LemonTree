import XCTest

final class LemonTreeUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    @MainActor
    func testAppLaunchesSuccessfully() throws {
        let app = XCUIApplication()
        app.launch()

        // Verify the app launched by checking for the navigation title
        XCTAssertTrue(app.navigationBars["Home"].exists)
    }

    @MainActor
    func testAddItemButtonExists() throws {
        let app = XCUIApplication()
        app.launch()

        // Verify the add item button exists
        XCTAssertTrue(app.buttons["Add Item"].exists)
    }

    @MainActor
    func testAddingItemIncrementsCount() throws {
        let app = XCUIApplication()
        app.launch()

        // Initial state should show "Items: 0"
        XCTAssertTrue(app.staticTexts["Items: 0"].exists)

        // Tap Add Item
        app.buttons["Add Item"].tap()

        // Count should now show "Items: 1"
        XCTAssertTrue(app.staticTexts["Items: 1"].exists)
    }
}
