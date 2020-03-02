//
//  Code.swift
//  Code
//
//  Created by hoemoon on 2020/03/02.
//

struct Code {
	enum DestTable: String {
		case null0
		case M
		case D
		case MD
		case A
		case AM
		case AD
		case AMD
		
		var code: String {
			switch self {
			case .null0: return "000"
			case .M: return "001"
			case .D: return "010"
			case .MD: return "011"
			case .A: return "100"
			case .AM: return "101"
			case .AD: return "110"
			case .AMD: return "111"
			}
		}
	}
	
	enum CompTable: String {
		case zero = "0"
		case one = "1"
		case minusOne = "-1"
		case D
		case A
		case exD = "!D"
		case exA = "!A"
		case minusD = "-D"
		case minusA = "-A"
		case DplusOne = "D+1"
		case AplusOne = "A+1"
		case DminusOne = "D-1"
		case AminusOne = "A-1"
		case DplusA = "D+A"
		case DminusA = "D-A"
		case AminusD = "A-D"
		case DandA = "D&A"
		case DorA = "D|A"
		case M
		case exM = "!M"
		case minusM = "-M"
		case MplusOne = "M+1"
		case MminusOne = "M-1"
		case DplusM = "D+M"
		case DminusM = "D-M"
		case MminusD = "M-D"
		case DandM = "D&M"
		case DorM = "D|M"
		
		var code: String {
			switch self {
			case .zero: return "0101010"
			case .one: return "0111111"
			case .minusOne: return "0111010"
			case .D: return "0001100"
			case .A: return "0110000"
			case .exD: return "0001101"
			case .exA: return "0110001"
			case .minusD: return "0001111"
			case .minusA: return "0110011"
			case .DplusOne: return "0011111"
			case .AplusOne: return "0110111"
			case .DminusOne: return "0001110"
			case .AminusOne: return "0110010"
			case .DplusA: return "0000010"
			case .DminusA: return "0010011"
			case .AminusD: return "0000111"
			case .DandA: return "0000000"
			case .DorA: return "0010101"
			case .M: return "1110000"
			case .exM: return "1110001"
			case .minusM: return "1110011"
			case .MplusOne: return "1110111"
			case .MminusOne: return "1110010"
			case .DplusM: return "1000010"
			case .DminusM: return "1010011"
			case .MminusD: return "1000111"
			case .DandM: return "1000000"
			case .DorM: return "1010101"
			}
		}
	}
	
	enum JumpTable: String {
		case null
		case JGT
		case JEQ
		case JGE
		case JLT
		case JNE
		case JLE
		case JMP
		
		var code: String {
			switch self {
			case .null: return "000"
			case .JGT: return "001"
			case .JEQ: return "010"
			case .JGE: return "011"
			case .JLT: return "100"
			case .JNE: return "101"
			case .JLE: return "110"
			case .JMP: return "111"
			}
		}
	}
	
	static func dest(symbol: String) -> String {
		guard let dest = DestTable(rawValue: symbol) else {
			return ""
		}
		return dest.code
	}
	
	static func comp(symbol: String) -> String {
		guard let comp = CompTable(rawValue: symbol) else {
			return ""
		}
		return comp.code
	}
	
	static func jump(symbol: String) -> String {
		guard let jump = JumpTable(rawValue: symbol) else {
			return ""
		}
		return jump.code
	}
}
