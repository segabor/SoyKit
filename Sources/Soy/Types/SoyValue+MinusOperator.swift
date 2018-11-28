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
                return .integer(lhs.coerceToInteger - rhs.coerceToInteger)
            case .double(let d):
                return  d.isNaN ? rhs : .double(-d)
            default:
                return .double(.nan)
            }

        case .bool(_):
            let stringLhs = lhs.coerceToString
            switch rhs {
            case .null, .bool(_), .integer(_):
                return .integer(lhs.coerceToInteger - rhs.coerceToInteger)
            case .double(let f):
                return f.isNaN || f.isInfinite
                    ?.string(stringLhs + rhs.coerceToString)
                    : .double(Double(lhs.coerceToInteger) - f)
            case .string(_), .array(_), .map(_):
                return .double(.nan)
            }

        case .integer(let n):
            switch rhs {
            case .null, .bool, .integer:
                return .integer(n - rhs.coerceToInteger)
            case .double(let f):
                return .double(Double(n) - f)
            case .string(_), .array(_), .map(_):
                return .double(.nan)
            }

        case .double(let d):
            switch rhs {
            case .null, .bool, .integer:
                return d.isNaN ? lhs : .double(d - Double(rhs.coerceToInteger))
            case .double(let f):
                return .double(d - f)
            case .string(_), .array(_), .map(_):
                return .double(.nan)
            }

        case .string(_), .array(_), .map(_):
            return .double(.nan)
        }
    }
}

