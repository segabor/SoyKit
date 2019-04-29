//
//  Strings.swift
//  SoyKit
//
//  Created by Sebestyén Gábor on 2019. 04. 15..
//

import Foundation

public enum Strings {
    
    // strLen(str)
    // Returns the length of a string.
    public static func StrLength(_ value: SoyValue) throws -> SoyValue {
        guard case let .string(str) = value else {
            throw RuntimeError.invalidInput
        }

        return .integer( str.count )
    }

    // strContains(str, subStr)
    // Checks whether a string contains a particular substring
    public static func StrContains(_ value: SoyValue, _ subStringValue: SoyValue) throws -> SoyValue {
        guard case let .string(val) = value, case let .string(subStr) = subStringValue else {
            throw RuntimeError.invalidInput
        }

        return .bool( val.contains(subStr) )
    }
}
