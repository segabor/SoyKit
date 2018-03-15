//
//  Sanitizable.swift
//  Soy
//
//  Created by Gábor Sebestyén on 2018. 03. 15..
//

public protocol Sanitizable {
    var safe: Bool {get}
    var content: String {get}
}
