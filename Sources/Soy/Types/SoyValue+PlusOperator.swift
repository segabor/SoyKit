//
//  SoyValue+PlusOperator.swift
//  Soy
//
//  Created by Sebestyén Gábor on 2018. 11. 26..
//

extension SoyValue {
    public static func + (lhs: SoyValue, rhs: SoyValue) -> SoyValue {
        
        switch lhs {
        case .null:
            switch rhs {
            case .null, .bool(_), .integer(_):
                return adjusted(.integer(lhs.coerceToInteger + rhs.coerceToInteger))
            case .double(_):
                return adjusted(rhs)
            default:
                return adjusted(.string(lhs.coerceToString + rhs.coerceToString))
            }
            
        case .bool(_):
            let stringLhs = lhs.coerceToString
            switch rhs {
            case .null, .bool(_), .integer(_):
                return adjusted(.integer(lhs.coerceToInteger + rhs.coerceToInteger))
            case .double(let f):
                return f.isNaN || f.isInfinite
                    ? .string(stringLhs + rhs.coerceToString)
                    : adjusted(.double(Double(lhs.coerceToInteger) + f))
            case .string(_), .array(_), .map(_):
                return adjusted(.string(stringLhs + rhs.coerceToString))
            }
            
        case .integer(let n):
            switch rhs {
            case .null, .bool, .integer:
                return adjusted(.integer(n + rhs.coerceToInteger))
            case .double(let f):
                return adjusted(.double(Double(n) + f))
            case .string(_), .array(_), .map(_):
                return adjusted(.string(lhs.coerceToString + rhs.coerceToString))
            }
            
        case .double(let d):
            switch rhs {
            case .null, .bool, .integer:
                return adjusted(d.isNaN || d.isInfinite ? lhs : .double(d + Double(rhs.coerceToInteger)))
            case .double(let f):
                return adjusted(.double(d + f))
            case .string(_), .array(_), .map(_):
                return adjusted(.string(lhs.coerceToString + rhs.coerceToString))
            }
        
        // FIXME: add 'numeric' string case
        // FIXME: add empty string case
        case .string(let ls):
            return adjusted(.string(ls + rhs.coerceToString))
            
        case .array(let array):
            switch rhs {
            case .null, .bool(_), .integer(_), .double(_), .string(_), .map(_):
                return adjusted(.string(lhs.coerceToString + rhs.coerceToString))
            case .array(let otherArray):
                return adjusted(.array(array + otherArray))
            }
            
        case .map(_):
            return adjusted(.string(lhs.coerceToString + rhs.coerceToString))
        }
    }
}

