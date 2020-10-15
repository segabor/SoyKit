//
//  StringBuffer.swift
//  
//
//  Created by Sebestyén Gábor on 2020. 09. 26..
//

import Foundation

public class StringBuffer: Appender {

    public let contentKind: ContentKind

    private var buffer = String()

    public init(with kind: ContentKind) throws {
        guard kind == .TEXT || kind == .HTML else {
            throw AppenderError.UNSUPPORTED_CONTENT_TYPE
        }

        contentKind = kind
    }


    public func append(string: String) -> Self {
        buffer += string
        return self
    }

    public func asString() -> String {
        return String(buffer)
    }

    public func asBytes() -> [UInt8] {
        return [UInt8](buffer.utf8)
    }
}
