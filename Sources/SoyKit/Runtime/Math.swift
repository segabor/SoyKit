//
//  Runtime+Math.swift
//  Soy
//
//  Created by Gábr Sebestyén on 209. 02. 25..
//

#if os(macOS)
import Darwin
#elseif os(Linux)
import Glibc
#endif


//
// Math functions support
//
public struct Math {

    public static func round(_ value: SoyValue) throws -> SoyValue {
        switch value {
        case .integer:
            return value
        case .double(let d):
            #if os(macOS)
            return .double( Darwin.round(d) )
            #else
            return .double( Glibc.round(d) )
            #endif
        default:
            throw RuntimeError.invalidInput
        }
    }

    public static func ceiling(_ value: SoyValue) throws -> SoyValue {
        switch value {
        case .integer:
            return value
        case .double(let d):
            #if os(macOS)
            return .integer( Int(Darwin.ceil(d)) )
            #else
            return .integer( Int(Glibc.ceil(d)) )
            #endif
        default:
            throw RuntimeError.invalidInput
        }
    }

    public static func floor(_ value: SoyValue) throws -> SoyValue {
        switch value {
        case .integer:
            return value
        case .double(let d):
            #if os(macOS)
            return .integer( Int(Darwin.floor(d)) )
            #else
            return .integer( Int(Glibc.floor(d)) )
            #endif
        default:
            throw RuntimeError.invalidInput
        }
    }

    public static func min(_ left: SoyValue, _ right: SoyValue) throws -> SoyValue {
        guard let d1 = left.coerceToNumber?.doubleValue,
            let d2 = right.coerceToNumber?.doubleValue else {
                throw RuntimeError.invalidInput
        }

        return d1 < d2 ? left : right
    }

    public static func max(_ left: SoyValue, _ right: SoyValue) throws -> SoyValue {
        guard let d1 = left.coerceToNumber?.doubleValue,
            let d2 = right.coerceToNumber?.doubleValue else {
                throw RuntimeError.invalidInput
        }

        return d1 > d2 ? left : right
    }
}
