//
//  SoyValue+MinusOperator.swift
//  Soy
//
//  Created by Sebestyén Gábor on 2018. 11. 28..
//

extension SoyValue {
    public static func - (lhs: SoyValue, rhs: SoyValue) -> SoyValue {
        if let lhn = lhs.coerceToNumber, let rhn = rhs.coerceToNumber {
            switch (lhn, rhn) {
            case (.int(let ln), .int(let rn)):
                return .integer(ln - rn)
            case (.double(let ld), .int(let rn)):
                return .double(ld - Double(rn))
            case (.int(let ln), .double(let rd)):
                return .double(Double(ln) - rd)
            case (.double(let ld), .double(let rd)):
                return .double(ld - rd)
            }
        }

        return .double(.nan)
    }
}
