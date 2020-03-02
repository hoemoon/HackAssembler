import XCTest
@testable import Code

final class CodeTests: XCTestCase {
	// MARK: - dest, 3비트
	func test_dest1() {
		let code = Code.dest(symbol: "null0")
		XCTAssertEqual(code, "000")
	}
	
	// MARK: - comp, 7비트
	// MARK: a = 0
	func test_comp1() {
		let code = Code.comp(symbol: "0")
		XCTAssertEqual(code, "0101010")
	}
	
	func test_comp2() {
		let code = Code.comp(symbol: "-1")
		XCTAssertEqual(code, "0111010")
	}
	
	func test_comp3() {
		let code = Code.comp(symbol: "-A")
		XCTAssertEqual(code, "0110011")
	}
	
	// MARK: a = 1
	func test_comp4() {
		let code = Code.comp(symbol: "D&M")
		XCTAssertEqual(code, "1000000")
	}
	
	func test_comp5() {
		let code = Code.comp(symbol: "!M")
		XCTAssertEqual(code, "1110001")
	}
	
	// MARK: - jump, 3 비트
	func test_jump1() {
		let code = Code.jump(symbol: "null")
		XCTAssertEqual(code, "000")
	}
	
	func test_jump2() {
		let code = Code.jump(symbol: "JEQ")
		XCTAssertEqual(code, "010")
	}
	
	func test_jump3() {
		let code = Code.jump(symbol: "JNE")
		XCTAssertEqual(code, "101")
	}
}
