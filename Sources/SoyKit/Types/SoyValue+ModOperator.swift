//
//  SoyValue+ModOperator.swift
//  Soy
//
//  Created by Sebestyén Gábor on 2018.2. 01..
//

extension SoyValue {
    public static func % (lhs: SoyValue, rhs: SoyValue) -> SoyValue {
        if let lhn = lhs.coerceToNumber, let rhn = rhs.coerceToNumber {
            switch (lhn, rhn) {
            case (.int(let ln), .int(let rn)):
                return rn == 0
                    ? .double(.nan)
                    : .integer(ln % rn)
            case (.double(let ld), .int(let rn)):
                return  rn == 0
                    ? .double(.nan)
                    : .double( ld.truncatingRemainder(dividingBy: Double(rn)) )
            case (.int(let ln), .double(let rd)):
                return rd.isZero
                    ? .double(.nan)
                    : .double( Double(ln).truncatingRemainder(dividingBy: rd) )
            case (.double(let ld), .double(let rd)):
                return rd.isZero
                    ? .double(.nan)
                    : .double( ld.truncatingRemainder(dividingBy: rd) )
            }
        }

        return .double(.nan)
    }
}
