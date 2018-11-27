//
//  SoyValue+Coercible.swift
//  Soy
//
//  Created by Gábor Sebestyén on 2018. 11. 26..
//

extension SoyValue {
    static let NULL_TO_STRING: String = "null"
    static let NAN_TO_STRING: String = "NaN"
    static let INF_TO_STRING: String = "Infinity"
}


public protocol Coercible {
    var coerceToString: String {get}
    var coerceToInteger: Int {get}
}

extension SoyValue: Coercible {
    public var coerceToString: String {
        switch self {
        case .null:
            return SoyValue.NULL_TO_STRING
        case .bool(let flag):
            return flag ? "true" : "false"
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
        case .map(_):
            return "[object Object]"
        }
    }

    public var coerceToInteger: Int {
        switch self {
        case .null:
            return 0
        case .bool(let flag):
            return flag ? 1 : 0
        case .integer(let n):
            return n
        case .double(let f):
            return Int(f)
        case .string(let s):
            if let coerced = Int(s) {
                return coerced
            }
            fatalError("String \(s) cannot be converted to number")
        default:
            fatalError("Unimplemented numeric conversion for \(self)")
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

