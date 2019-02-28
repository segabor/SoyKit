//
//  SoyValue+NotOperator.swift
//  Soy
//
//  Created by Sebestyén Gábor on 2018. 12. 01..
//

import Foundation

extension SoyValue {
    public static prefix func ! (lhs: SoyValue) -> SoyValue {
        return .bool( !lhs.coerceToBool )
    }
}
