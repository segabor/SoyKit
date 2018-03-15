//
//  SanitizedContent.swift
//  Soy
//
//  Created by Gábor Sebestyén on 2018. 03. 15..
//

import Foundation

public struct SanitizedContent: Sanitizable, Equatable, CustomStringConvertible {
    
    public let content: String
    
    public var safe: Bool {
        return true
    }

    public init(safeContent content: String) {
        self.content = content
    }

    // Equatable
    public static func ==(left: SanitizedContent, right: SanitizedContent) -> Bool {
        return left.content == right.content
    }
    
    // CustomStringConvertible
    public var description: String {
        return content
    }
}

// ExpressibleByStringLiteral
extension SanitizedContent: ExpressibleByStringLiteral {
    public init(stringLiteral value: String) {
        self.content = value
    }
}
