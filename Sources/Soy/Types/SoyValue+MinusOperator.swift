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
                return adjusted(.integer(lhs.coerceToInteger - rhs.coerceToInteger))
            case .double(let d):
                return adjusted(d.isNaN ? rhs : .double(-d))
            default:
                return adjusted(.double(.nan))
            }

        case .bool(_):
            let stringLhs = lhs.coerceToString
            switch rhs {
            case .null, .bool(_), .integer(_):
                return adjusted(.integer(lhs.coerceToInteger - rhs.coerceToInteger))
            case .double(let f):
                return f.isNaN || f.isInfinite
                    ? .string(stringLhs + rhs.coerceToString)
                    : adjusted(.double(Double(lhs.coerceToInteger) - f))
            case .string(_), .array(_), .map(_):
                return adjusted(.double(.nan))
            }

        case .integer(let n):
            switch rhs {
            case .null, .bool, .integer:
                return adjusted(.integer(n - rhs.coerceToInteger))
            case .double(let f):
                return adjusted(.double(Double(n) - f))
            case .string(_), .array(_), .map(_):
                return adjusted(.double(.nan))
            }

        case .double(let d):
            switch rhs {
            case .null, .bool, .integer:
                return adjusted(d.isNaN ? lhs : .double(d - Double(rhs.coerceToInteger)))
            case .double(let f):
                return adjusted(.double(d - f))
            case .string(_), .array(_), .map(_):
                return adjusted(.double(.nan))
            }

        // FIXME: add 'numeric' string case
        // FIXME: add empty string case
        case .string(_), .array(_), .map(_):
            return adjusted(.double(.nan))
        }
    }
}

