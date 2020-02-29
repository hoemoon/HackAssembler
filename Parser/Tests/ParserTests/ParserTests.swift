import XCTest
@testable import Parser

final class ParserTests: XCTestCase {
	func test_Can_Make_Parser_With_Text() {
		_ = Parser(text: addASM)
	}
}
