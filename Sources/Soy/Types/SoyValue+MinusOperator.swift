//
//  SoyValue+MinusOperator.swift
//  Soy
//
//  Created by Sebestyén Gábor on 2018. 11. 28..
//

extension SoyValue {
    public static func - (lhs: SoyValue, rhs: SoyValue) -> SoyValue {
        
        switch lhs {
        case .null:
            switch rhs {
            case .null, .bool(_), .integer(_):
                return .integer(lhs.coerceToInteger + rhs.coerceToInteger)
            case .double(_):
                return rhs
            default:
                return .string(lhs.coerceToString + rhs.coerceToString)
            }
            
        case .bool(_):
            let stringLhs = lhs.coerceToString
            switch rhs {
            case .null, .bool(_), .integer(_):
                return .integer(lhs.coerceToInteger + rhs.coerceToInteger)
            case .double(let f):
                return f.isNaN || f.isInfinite
                    ?.string(stringLhs + rhs.coerceToString)
                    : .double(Double(lhs.coerceToInteger) + f)
            case .string(_), .array(_), .map(_):
                return .string(stringLhs + rhs.coerceToString)
            }
            
        case .integer(let n):
            switch rhs {
            case .null, .bool, .integer:
                return .integer(n + rhs.coerceToInteger)
            case .double(let f):
                return .double(Double(n) + f)
            case .string(_), .array(_), .map(_):
                return .string(lhs.coerceToString + rhs.coerceToString)
            }
            
        case .double(let d):
            switch rhs {
            case .null, .bool, .integer:
                return d.isNaN || d.isInfinite ? lhs : .double(d + Double(rhs.coerceToInteger))
            case .double(let f):
                return .double(d + f)
            case .string(_), .array(_), .map(_):
                return .string(lhs.coerceToString + rhs.coerceToString)
            }
            
        case .string(let ls):
            return .string(ls + rhs.coerceToString)
            
        case .array(let array):
            switch rhs {
            case .null, .bool(_), .integer(_), .double(_), .string(_), .map(_):
                return .string(lhs.coerceToString + rhs.coerceToString)
            case .array(let otherArray):
                return .array(array + otherArray)
            }
            
        case .map(_):
            return .string(lhs.coerceToString + rhs.coerceToString)
        }
    }
}

