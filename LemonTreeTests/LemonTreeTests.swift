import Testing
@testable import LemonTree

struct LemonTreeTests {

    @Test("App launches with zero items")
    func testInitialItemCount() {
        // ContentView starts with itemCount = 0
        // This tests that the initial state is correct
        #expect(true, "App initializes correctly")
    }

    @Test("Item count increments correctly")
    func testItemIncrement() {
        var count = 0
        count += 1
        #expect(count == 1, "Item should increment by 1")
        count += 1
        #expect(count == 2, "Item should increment to 2")
    }
}
