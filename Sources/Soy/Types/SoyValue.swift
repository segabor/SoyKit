//
//  SoyValue.swift
//  Soy
//
//  Created by Gábor Sebestyén on 2018. 11. 26..
//

public enum SoyValue: Equatable {
    case null
    case bool(Bool)
    case integer(Int)
    case double(Double)
    case string(String)
    case array(Array<SoyValue>)
    case map(Dictionary<String, SoyValue>)
}





//
// init helpers
//

extension SoyValue: ExpressibleByNilLiteral {
    public init(nilLiteral: ()) {
        self = .null
    }
}

extension SoyValue: ExpressibleByBooleanLiteral {
    public init(booleanLiteral value: Bool) {
        self = .bool(value)
    }
}

extension SoyValue: ExpressibleByFloatLiteral {
    public init(floatLiteral value: Double) {
        self = .double(value)
    }
}

extension SoyValue: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: Int) {
        self = .integer(value)
    }
}

extension SoyValue: ExpressibleByStringLiteral {
    public init(stringLiteral value: String) {
        self = .string(value)
    }
}

extension SoyValue: ExpressibleByArrayLiteral {
    public init(arrayLiteral elements: SoyValue...) {
        self = .array(elements)
    }
}

extension SoyValue: ExpressibleByDictionaryLiteral {
    public init(dictionaryLiteral elements: (String, SoyValue)...) {
        self = .map(Dictionary(uniqueKeysWithValues: elements))
    }
}

