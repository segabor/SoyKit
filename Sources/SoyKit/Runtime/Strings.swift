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
    //   or -1. Case-sensitive, 0-based index.
    public static func strIndexOf(_ value: SoyValue, _ subStringValue: SoyValue) throws -> SoyValue {
        guard case let .string(str) = value, case let .string(subStr) = subStringValue else {
            throw RuntimeError.invalidInput
        }

        if let subRange = str.range(of: subStr) {
            return .integer( str.distance(from: str.startIndex, to: subRange.lowerBound) )
        }
        return .integer( -1 )
    }

    // strSub(str, start)
    // Returns the substring of str beginning at index start.
    //
    // strSub(str, start, end)
    // Returns the substring of str beginning at index start,
    //   and ending at end - 1.
    public static func strSub(_ value: SoyValue, _ startIndexValue: SoyValue, _ endIndexValue: SoyValue = .integer(-1)) throws -> SoyValue {
        guard case let .string(str) = value,
            case let .integer(si) = startIndexValue,
            case let .integer(ei) = endIndexValue
        else {
            throw RuntimeError.invalidInput
        }

        guard si >= 0,
            (ei == -1 || ei >= si),
            let lower = str.index(str.startIndex, offsetBy: si, limitedBy: str.endIndex),
            let upper = ei == -1 ? str.endIndex : str.index(str.startIndex, offsetBy: ei, limitedBy: str.endIndex)
        else {
            // return null if range is invalid
            return .null
        }

        return .string( String( str[lower..<upper] ))
    }
}
