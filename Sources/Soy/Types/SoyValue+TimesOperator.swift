//
//  SoyValue+TimesOperator.swift
//  Soy
//
//  Created by Sebestyén Gábor on 2018. 11. 28..
//

extension SoyValue {
    public static func * (lhs: SoyValue, rhs: SoyValue) -> SoyValue {

        switch lhs {
        case .null:
            switch rhs {
            case .null, .bool(_), .integer(_):
                return adjusted(.integer(0))
            case .double(let d):
                return adjusted(d.isNaN || d.isInfinite ? .double(.nan) : .integer(0))
            case .string(let s):
                if let _ = Int(s) {
                    return adjusted(.integer(0))
                }
                if let _ = Double(s) {
                    return adjusted(.double(0) )
                } else {
                    return adjusted(.double(.nan))
                }
            default:
                return adjusted(.double(.nan))
            }

        case .bool(_):
            let intLhs: Int = lhs.coerceToInteger
            switch rhs {
            case .null, .bool(_), .integer(_):
                return adjusted(.integer(intLhs * rhs.coerceToInteger))
            case .double(let d):
                return adjusted(.double(Double(intLhs) * d))
            case .string(let s):
                if let n = Int(s) {
                    return adjusted(.integer(intLhs * n))
                }
                if let d = Double(s) {
                    return adjusted(.double(Double(intLhs) * d) )
                } else {
                    return adjusted(.double(.nan))
                }
            case .array(_), .map(_):
                return adjusted(.double(.nan))
            }

        case .integer(let n):
            switch rhs {
            case .null, .bool, .integer:
                return adjusted(.integer(n * rhs.coerceToInteger))
            case .double(let f):
                return adjusted(.double(Double(n) * f))
            case .string(let s):
                if let m = Int(s) {
                    return adjusted(.integer(n * m))
                }
                if let d = Double(s) {
                    return adjusted(.double(Double(n) * d))
                } else {
                    return adjusted(.double(.nan))
                }
            case .array(_), .map(_):
                return adjusted(.double(.nan))
            }

        case .double(let d):
            switch rhs {
            case .null, .bool, .integer:
                return adjusted(.double(d * Double(rhs.coerceToInteger)))
            case .double(let f):
                return adjusted(.double(d * f))
            case .string(let s):
                if let n = Int(s) {
                    return adjusted(.double(d * Double(n)))
                }
                if let q = Double(s) {
                    return adjusted(.double(d * q))
                } else {
                    return adjusted(.double(.nan))
                }
            case .array(_), .map(_):
                return adjusted(.double(.nan))
            }

        case .string(let s):
            if let n = Int(s) {
                return adjusted(.integer(n) * rhs)
            }
            if let q = Double(s) {
                return adjusted(.double(q) * rhs)
            } else {
                return adjusted(.double(.nan))
            }
        case .array(let a):
            return a.isEmpty
                ? .integer(0) * rhs
                : .double(.nan)

        case .map(_):
            return adjusted(.double(.nan))
        }
    }
}

