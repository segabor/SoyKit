//
//  SoyValue+ComparisonOperators.swift
//  Soy
//
//  Created by Sebestyén Gábor on 2018. 12. 01..
//

import Foundation

extension SoyValue {
    public static func < (lhs: SoyValue, rhs: SoyValue) -> SoyValue {
        if let lhn = lhs.coerceToNumber, let rhn = rhs.coerceToNumber {
            switch (lhn, rhn) {
            case (.int(let ln), .int(let rn)):
                return .bool(ln < rn)
            case (.double(let ld), .int(let rn)):
                return .bool(ld < Double(rn))
            case (.int(let ln), .double(let rd)):
                return .bool(Double(ln) < rd)
            case (.double(let ld), .double(let rd)):
                return .bool(ld < rd)
            }
        }

        return .bool(lhs.coerceToString < rhs.coerceToString)
    }

    public static func > (lhs: SoyValue, rhs: SoyValue) -> SoyValue {
        if let lhn = lhs.coerceToNumber, let rhn = rhs.coerceToNumber {
            switch (lhn, rhn) {
            case (.int(let ln), .int(let rn)):
                return .bool(ln > rn)
            case (.double(let ld), .int(let rn)):
                return .bool(ld > Double(rn))
            case (.int(let ln), .double(let rd)):
                return .bool(Double(ln) > rd)
            case (.double(let ld), .double(let rd)):
                return .bool(ld > rd)
            }
        }

        return .bool(lhs.coerceToString < rhs.coerceToString)
    }

    public static func == (lhs: SoyValue, rhs: SoyValue) -> SoyValue {
        switch (lhs, rhs) {
        case (.null, .null):
            return .bool(true)
        case (.bool(let lb), .bool(let rb)):
            return .bool(lb == rb)

        case (.integer(let ln), .integer(let rn)):
            return .bool(ln == rn)
        case (.double(let ld), .integer(let rn)):
            return .bool(ld.isEqual(to: Double(rn))  )
        case (.integer(let ln), .double(let rd)):
            return .bool(Double(ln).isEqual(to: rd))
        case (.double(let ld), .double(let rd)):
            return .bool(ld.isEqual(to: rd))

        case (.string(let ls), .string(let rs)):
            return .bool(ls == rs)

        case (.array(let la), .array(let ra)):
            return .bool(la == ra)

        case (.map(let lm), .map(let rm)):
            return .bool(lm == rm)

        default:
            return .bool( lhs.coerceToString == rhs.coerceToString )
        }
    }

    public static func != (lhs: SoyValue, rhs: SoyValue) -> SoyValue {
        let result = lhs == rhs

        guard case .bool(let flag) = result else {
            return false
        }

        return .bool(!flag)
    }

    public static func <= (lhs: SoyValue, rhs: SoyValue) -> SoyValue {
        let result1 = lhs < rhs, result2 = lhs == rhs

        guard case .bool(let b1) = result1, case .bool(let b2) = result2 else {
            return false
        }

        return .bool(b1 || b2)
    }

    public static func >= (lhs: SoyValue, rhs: SoyValue) -> SoyValue {
        let result1 = lhs > rhs, result2 = lhs == rhs
        
        guard case .bool(let b1) = result1, case .bool(let b2) = result2 else {
            return false
        }

        return .bool(b1 || b2)
    }
}
