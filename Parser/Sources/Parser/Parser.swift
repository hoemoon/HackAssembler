//
//  Parser.swift
//  Parser
//
//  Created by hoemoon on 2020/03/01.
//

import Foundation

public enum CommandType {
	case A_COMMAND
	case C_COMMAND
	case L_COMMAND
	
	init(_ command: String) {
		if command.hasPrefix("@") {
			self = .A_COMMAND
		} else if command.hasPrefix("("), command.hasSuffix(")") {
			self = .L_COMMAND
		} else {
			self = .C_COMMAND
		}
	}
}

public struct Parser {
	let commands: [String]
	var currentCommandIndex = 0
	
	private var command: String {
		commands[currentCommandIndex]
	}
	
	public init(text: String) {
		let filtered = text.components(separatedBy: "\n")
			.filter { $0.count > 0 }
			.filter { !$0.hasPrefix("//") }
		self.commands = filtered
			.compactMap { $0.components(separatedBy: "//").first }
			.map { $0.replacingOccurrences(of: " ", with: "") }
	}
	
	public var hasMoreCommands: Bool {
		commands.count != 0
	}
	public mutating func advance() {
		currentCommandIndex += 1
	}
	public var commandType: CommandType {
		CommandType(command)
	}
	public var symbol: String? {
		switch commandType {
			case .A_COMMAND:
				return command.replacingOccurrences(of: "@", with: "")
			case .C_COMMAND:
				return nil
			case .L_COMMAND:
				let startIndex = command.index(command.startIndex, offsetBy: 1)
				let endIndex = command.index(command.startIndex, offsetBy: command.count - 2)
				return String(command[startIndex...endIndex])
		}
	}
	public var dest: String? {
		guard commandType == .C_COMMAND else {
			return nil
		}
		guard command.contains("=") else {
			return "null0"
		}
		return command.components(separatedBy: "=").first
	}
	public var comp: String? {
		guard commandType == .C_COMMAND else {
			return nil
		}
		if command.contains("=") {
			return command.components(separatedBy: "=")[1]
		}
		if command.contains(";") {
			return command.components(separatedBy: ";").first
		}
		return nil
	}
	public var jump: String? {
		guard commandType == .C_COMMAND else {
			return nil
		}
		guard command.contains(";") else {
			return "null"
		}
		return command.components(separatedBy: ";")[1]
	}
}
