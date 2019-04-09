//
//  SoyValue+SafeDataAccess.swift
//  SoyKit
//
//  Created by Sebestyén Gábor on 2019. 04. 09..
//

// designated safe getter for internal evaluations
public extension SoyValue {
    func get(_ key: String) -> SoyValue {
        guard case let .map(m) = self, let value = m[key] else {
            return SoyValue.null
        }

        return value
    }
}
