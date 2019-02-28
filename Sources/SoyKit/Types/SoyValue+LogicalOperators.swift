//
//  SoyValue+LogicalOperators.swift
//  Soy
//
//  Created by Sebestyén Gábor on 2018. 12. 01..
//

import Foundation

extension SoyValue {
    public static func || (lhs: SoyValue, rhs: SoyValue) -> SoyValue {
        return .bool(lhs.coerceToBool || rhs.coerceToBool)
    }

    public static func && (lhs: SoyValue, rhs: SoyValue) -> SoyValue {
        return .bool(lhs.coerceToBool && rhs.coerceToBool)
    }
}
