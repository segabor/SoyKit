//
//  SoyValue+UnaryMinusOperator.swift
//  SoyKit
//
//  Created by Sebestyén Gábor on 2018. 12. 01..
//

import Foundation

extension SoyValue {
    public static prefix func - (lhs: SoyValue) -> SoyValue {
        if let lhn = lhs.coerceToNumber {
            switch (lhn) {
            case .int(let ln):
                return .integer(-ln)
            case .double(let ld):
                return .double(-ld)
            }
        }

        return .double(.nan)
    }
}
