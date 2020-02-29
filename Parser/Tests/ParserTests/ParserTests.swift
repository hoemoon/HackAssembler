import XCTest
@testable import Parser

final class ParserTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Parser().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
