//
//  Dictionary+SoyValue.swift
//  Soy
//
//  Created by Sebestyén Gábor on 2018. 12. 05..
//

import Foundation

public extension Dictionary where Key == String, Value == SoyValue {
    // designated safe getter for internal evaluations
    func get(_ key: String) -> SoyValue {
        guard let value = self[key] else {
            return SoyValue.null
        }

        return value
    }
}
