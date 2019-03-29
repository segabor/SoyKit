//
//  SoyValue+Coercible.swift
//  Soy
//
//  Created by Gábor Sebestyén on 2018. 11. 26..
//

extension SoyValue {
    static let NULL_TO_STRING: String = "null"
    static let TRUE_TO_STRING: String = "true"
    static let FALSE_TO_STRING: String = "false"
    static let NAN_TO_STRING: String = "NaN"
    static let INF_TO_STRING: String = "Infinity"
}

public enum Number {
    case int(Int)
    case double(Double)

    var intValue: Int {
        switch(self) {
        case .int(let i):
            return i
        case .double(let d):
            return Int(d)
        }
    }

    var doubleValue: Double {
        switch(self) {
        case .int(let i):
            return Double(i)
        case .double(let d):
            return d
        }
    }
}

public protocol Coercible {
    var coerceToString: String {get}
    var coerceToNumber: Number? {get}
    var coerceToBool: Bool {get}
}

extension SoyValue: Coercible {
    public var coerceToString: String {
        switch self {
        case .null:
            return SoyValue.NULL_TO_STRING
        case .bool(let flag):
            return flag ? SoyValue.TRUE_TO_STRING : SoyValue.FALSE_TO_STRING
        case .integer(let n):
            return String(n)
        case .double(let f):
            if f.isNaN {
                return SoyValue.NAN_TO_STRING
            } else if f.isInfinite {
                return SoyValue.INF_TO_STRING
            } else {
                return String(f)
            }
        case .string(let s):
            return s
        case .array(let a):
            return a.map{$0.coerceToString}.joined(separator: ",")
        case .map:
            return "[object Object]"
        }
    }

    public var coerceToNumber: Number? {
        switch self {
        case .null:
            return .int(0)
        case .bool(let flag):
            return flag ? .int(1) : .int(0)
        case .integer(let n):
            return .int(n)
        case .double(let d):
            return .double(d)
        case .string(let s):
            if let n = Int(s) {
                return .int(n)
            }
            if let d = Double(s) {
                return .double(d)
            } else {
                return nil
            }
        case .array(let a):
            return a.isEmpty ? .int(0) : nil
        case .map:
            return nil
        }
    }

    //
    // Each primitive type has exactly one falsy value:
    // - null is falsy for null, false is falsy for booleans,
    // -  0 is falsy for integers,
    // -  0.0 is falsy for floats, and
    // - '' (empty string) is falsy for strings.
    // All other primitive values are truthy.
    // Maps and lists are always truthy even if they're empty. Undefined data keys are falsy.
    //
    public var coerceToBool: Bool {
        switch self {
        case .null:
            return false
        case .bool(let flag):
            return flag
        case .integer(let n):
            return n != 0
        case .double(let d):
            return !d.isZero
        case .string(let s):
            return !s.isEmpty
        default:
            return true
        }
    }
}





//
// Custom String Convertibles
//

extension SoyValue: CustomStringConvertible {
    public var description: String {
        return self.coerceToString
    }
}

