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
                return .integer(0)
            case .double(let d):
                return  d.isNaN || d.isInfinite ? .double(.nan) : .integer(0)
            case .string(let s):
                if let _ = Int(s) {
                    return .integer(0)
                }
                if let _ = Double(s) {
                    return .double(0) 
                } else {
                    return .double(.nan)
                }
            default:
                return .double(.nan)
            }

        case .bool(_):
            let intLhs: Int = lhs.coerceToInteger
            switch rhs {
            case .null, .bool(_), .integer(_):
                return .integer(intLhs * rhs.coerceToInteger)
            case .double(let d):
                return .double(Double(intLhs) * d)
            case .string(let s):
                if let n = Int(s) {
                    return .integer(intLhs * n)
                }
                if let d = Double(s) {
                    return .double(Double(intLhs) * d) 
                } else {
                    return .double(.nan)
                }
            case .array(_), .map(_):
                return .double(.nan)
            }

        case .integer(let n):
            switch rhs {
            case .null, .bool, .integer:
                return .integer(n * rhs.coerceToInteger)
            case .double(let f):
                return .double(Double(n) * f)
            case .string(let s):
                if let m = Int(s) {
                    return .integer(n * m)
                }
                if let d = Double(s) {
                    return .double(Double(n) * d)
                } else {
                    return .double(.nan)
                }
            case .array(_), .map(_):
                return .double(.nan)
            }

        case .double(let d):
            switch rhs {
            case .null, .bool, .integer:
                return .double(d * Double(rhs.coerceToInteger))
            case .double(let f):
                return .double(d * f)
            case .string(let s):
                if let n = Int(s) {
                    return .double(d * Double(n))
                }
                if let q = Double(s) {
                    return .double(d * q)
                } else {
                    return .double(.nan)
                }
            case .array(_), .map(_):
                return .double(.nan)
            }

        case .string(let s):
            if let n = Int(s) {
                return .integer(n) * rhs
            }
            if let q = Double(s) {
                return .double(q) * rhs
            } else {
                return .double(.nan)
            }
        case .array(let a):
            return a.isEmpty
                ? .integer(0) * rhs
                : .double(.nan)

        case .map(_):
            return .double(.nan)
        }
    }
}

