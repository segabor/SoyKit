//
//  String+Sanitizable.swift
//  Soy
//
//  Created by Gábor Sebestyén on 2018. 03. 15..
//

extension String: Sanitizable {
    public var safe: Bool {
        return false
    }

    public var content: String {
        return self
    }
}
