//
//  Appender.swift
//  
//
//  Created by Sebestyén Gábor on 2020. 09. 26..
//
public protocol Appender {
    var contentKind: ContentKind {get}

    func append(string: String) -> Self

    func asString() -> String

    func asBytes() -> [UInt8]
}
