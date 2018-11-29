//
//  SoyValue+PlusOperator.swift
//  Soy
//
//  Created by Sebestyén Gábor on 2018. 11. 26..
//

extension SoyValue {
    //
    // You can use the operator + for either adding numbers or concatenating strings.
    // When one of the two operands is a string, the other value is coerced to a string.
    // All primitive values have string representations.
    //
    public static func + (lhs: SoyValue, rhs: SoyValue) -> SoyValue {
        if let lhn = lhs.coerceToNumber, let rhn = rhs.coerceToNumber {
            switch (lhn, rhn) {
            case (.int(let ln), .int(let rn)):
                return .integer(ln + rn)
            case (.double(let ld), .int(let rn)):
                return .double(ld + Double(rn))
            case (.int(let ln), .double(let rd)):
                return .double(Double(ln) + rd)
            case (.double(let ld), .double(let rd)):
                return .double(ld + rd)
            }
        }

        switch (lhs, rhs) {
        case (.string(let s), _):
            return .string(s + rhs.coerceToString)
        case (_, .string(let s)):
            return .string(lhs.coerceToString + s)
        case (.array(let a1), .array(let a2)):
            return .array(a1 + a2)
        default:
            return .string( lhs.coerceToString + rhs.coerceToString )
        }        
    }
}
