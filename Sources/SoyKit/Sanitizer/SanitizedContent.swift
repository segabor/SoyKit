//
//  SanitizedContent.swift
//  Soy
//
//  Created by Gábor Sebestyén on 2018. 03. 15..
//

import Foundation

public struct SanitizedContent: Sanitizable, Equatable {

    public let content: String

    public private(set) var safe: Bool = false

    public init(unsafeContent content: String) {
        self.content = content
    }

    internal init(safeContent content: String) {
        self.content = content
        self.safe = true
    }
}

extension SanitizedContent: CustomStringConvertible {
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
