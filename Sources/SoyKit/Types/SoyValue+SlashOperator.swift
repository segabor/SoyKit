//
//  SoyValue+SlashOperator.swift
//  SoyKit
//
//  Created by Sebestyén Gábor on 2018. 11. 30..
//

import Foundation

extension SoyValue {
    // The / operator performs floating point division.
    // To divide two integers to get an integer,
    // use the floor function or a similar function
    // in tandem with the division operator.
    public static func / (lhs: SoyValue, rhs: SoyValue) -> SoyValue {
        if let lhn = lhs.coerceToNumber, let rhn = rhs.coerceToNumber {
            switch (lhn, rhn) {
            case (.int(let ln), .int(let rn)):
                return rn == 0 ? .double(.nan) : .double(Double(ln) / Double(rn))
            case (.double(let ld), .int(let rn)):
                return rn == 0 ? .double(.nan) : .double(ld / Double(rn))
            case (.int(let ln), .double(let rd)):
                return rd.isZero ? .double(.nan) : .double(Double(ln) / rd)
            case (.double(let ld), .double(let rd)):
                return rd.isZero ? .double(.nan) : .double(ld / rd)
            }
        }

        return .double(.nan)
    }
}
