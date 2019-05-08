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
    public static func strLength(_ value: SoyValue) throws -> SoyValue {
        guard case let .string(str) = value else {
            throw RuntimeError.invalidInput
        }

        return .integer( str.count )
    }

    // strContains(str, subStr)
    // Checks whether a string contains a particular substring
    public static func strContains(_ value: SoyValue, _ subStringValue: SoyValue) throws -> SoyValue {
        guard case let .string(str) = value, case let .string(subStr) = subStringValue else {
            throw RuntimeError.invalidInput
        }

        return .bool( str.contains(subStr) )
    }

    // strIndexOf(str, subStr)
    // Returns the first occurrence of substr within str,
    // or -1. Case-sensitive, 0-based index.
    public static func strIndexOf(_ value: SoyValue, _ subStringValue: SoyValue) throws -> SoyValue {
        guard case let .string(str) = value, case let .string(subStr) = subStringValue else {
            throw RuntimeError.invalidInput
        }

        if let subRange = str.range(of: subStr) {
            return .integer( subRange.lowerBound.utf16Offset(in: str) )
        }
        return .integer( -1 )
    }
}
