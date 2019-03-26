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

    static func round(_ value: SoyValue) -> SoyValue {
        switch value {
        case .integer:
            return value
        case .double(let d):
            return .double( Darwin.round(d) )
        default:
            return .double(.nan)
        }
    }
}
