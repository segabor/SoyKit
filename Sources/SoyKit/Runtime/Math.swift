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

    public static func round(_ value: SoyValue) -> SoyValue {
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
            return .double(.nan)
        }
    }
}
