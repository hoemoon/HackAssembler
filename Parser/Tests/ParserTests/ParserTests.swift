import XCTest
@testable import Parser

final class ParserTests: XCTestCase {
	func test_Can_Make_Parser_With_Text() {
		_ = Parser(text: addASM)
	}
	
	func test_When_Empty_Text_Then_hasMoreCommands_False() {
		let parser = Parser(text: "")
		XCTAssertFalse(parser.hasMoreCommands)
	}
	
	func test_When_MultilneText_Then_hasMoreCommands_True() {
		let parser = Parser(text: addASM)
		XCTAssertTrue(parser.hasMoreCommands)
	}
	
	func test_filter_comment() {
		let parser = Parser(text: sampleInput1)
		XCTAssertTrue(parser.commands.count == 2)
	}
	
	func test_When_Create_Parser_That_Has_CommandIndex() {
		let parser = Parser(text: sampleInput1)
		XCTAssertTrue(parser.currentCommandIndex == 0)
	}
	
	func test_When_Call_advance_Then_Increase_CommandIndex() {
		var parser = Parser(text: sampleInput1)
		parser.advance()
		XCTAssertTrue(parser.currentCommandIndex == 1)
	}
	
	func test_When_Current_Command_Is_A_Command_Then_Get_Type() {
		let parser = Parser(text: maxASM)
		XCTAssertTrue(parser.commandType == .A_COMMAND)
	}
	
	func test_When_Current_Command_Is_C_Command_Then_Get_Type() {
		var parser = Parser(text: maxASM)
		parser.advance()
		XCTAssertTrue(parser.commandType == .C_COMMAND)
	}
	
	func test_When_Current_Command_Is_L_Command_Then_Get_Type() {
		var parser = Parser(text: maxASM)
		for _ in 1...10 {
			parser.advance()
		}
		XCTAssertTrue(parser.commandType == .L_COMMAND)
	}
	
	func test_When_Current_Command_Is_C_Command_Then_Symbol_Be_Nil() {
		var parser = Parser(text: maxASM)
		parser.advance()
		XCTAssertNil(parser.symbol)
	}
		
	func test_When_Current_Command_Is_A_Command_Then_Symbol_Be_Address() {
		let parser = Parser(text: maxASM)
		if let symbol = parser.symbol {
			XCTAssertEqual(symbol, "R0")
		} else {
			XCTFail()
		}
	}
	
	func test_When_Current_Command_Is_L_Command_Then_Symbol_Be_Label() {
		var parser = Parser(text: maxASM)
		for _ in 1...10 {
			parser.advance()
		}
		if let symbol = parser.symbol {
			XCTAssertEqual(symbol, "OUTPUT_FIRST")
		} else {
			XCTFail()
		}
	}
	
	func test_When_CurrentCommand_Is_C_Command_Then_Dest_Be_DestCommand() {
		var parser = Parser(text: maxASM)
		parser.advance()
		if let dest = parser.dest {
			XCTAssertEqual(dest, "D")
		} else {
			XCTFail()
		}
	}
	
	func test_When_CurrentCommand_Is_C_Command_Then_Dest_Be_DestCommand2() {
		var parser = Parser(text: maxASM)
		for _ in 1...5 {
			parser.advance()
		}
		XCTAssertEqual(parser.dest, "null0")
	}
	
	func test_When_CurrentCommand_Is_C_Command_Then_Comp_Be_Comp() {
		var parser = Parser(text: maxASM)
		parser.advance()
		if let comp = parser.comp {
			XCTAssertEqual(comp, "M")
		} else {
			XCTFail()
		}
	}
	
	func test_When_CurrentCommand_Is_C_Command_Then_Comp_Be_Comp2() {
		var parser = Parser(text: maxASM)
		for _ in 1...5 {
			parser.advance()
		}
		if let comp = parser.comp {
			XCTAssertEqual(comp, "D")
		} else {
			XCTFail()
		}
	}
	
	func test_When_CurrentCommand_Is_C_Command_Then_Jump_Be_Jump() {
		var parser = Parser(text: maxASM)
		parser.advance()
		XCTAssertEqual(parser.jump, "null")
	}
	
	func test_When_CurrentCommand_Is_C_Command_Then_Jump_Be_Jump2() {
		var parser = Parser(text: maxASM)
		for _ in 1...5 {
			parser.advance()
		}
		if let jump = parser.jump {
			XCTAssertEqual(jump, "JGT")
		} else {
			XCTFail()
		}
	}
}

let sampleInput1 = """
// blabla
@2
D=A

"""
