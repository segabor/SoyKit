//
//  TimesOperatorTests.swift
//  Soy
//
//  Created by Sebestyén Gábor on 2018. 11. 26..
//

import XCTest
@testable import Soy

class TimesOperatorTests: XCTestCase {
    func testMultiplyWithNullValue() {
        let leftValue: SoyValue = nil

        XCTAssertEqual( leftValue * .null, SoyValue.integer(0) )
        XCTAssertEqual( leftValue * .bool(true), .integer(0) )
        XCTAssertEqual( leftValue * .bool(false), .integer(0) )

        XCTAssertEqual( leftValue * .integer(123), .integer(0) )
        XCTAssertEqual( leftValue * .double(3.14), .double(0) )
        if case .double(let value) = leftValue * .double(Double.nan), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue * .double(Double.infinity), value.isNaN {} else { XCTFail() }
    
        XCTAssertEqual( leftValue * .string("123"), .integer(0))
        XCTAssertEqual( leftValue * .string("3.14"), .double(0))
        if case .double(let value) = leftValue * .string("alma"), value.isNaN {} else { XCTFail() }

        if case .double(let value) = leftValue * ["alma", 1, 3.14], value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue * ["string": "alma", "int": 123], value.isNaN {} else { XCTFail() }
    }

    func testMultiplyWithBoolValue() {
        var leftValue: SoyValue = true

        XCTAssertEqual( leftValue * .null, SoyValue.integer(0) )
        XCTAssertEqual( leftValue * .bool(true), .integer(1) )
        XCTAssertEqual( leftValue * .bool(false), .integer(0) )
        
        XCTAssertEqual( leftValue * .integer(123), .integer(123) )
        XCTAssertEqual( leftValue * .double(3.14), .double(3.14) )
        if case .double(let value) = leftValue * .double(.nan), value.isNaN {} else { XCTFail() }
        XCTAssertEqual( leftValue * .double(Double.infinity), .double(.infinity) )

        XCTAssertEqual( leftValue * .string("123"), .integer(123))
        XCTAssertEqual( leftValue * .string("3.14"), .double(3.14))
        if case .double(let value) = leftValue * .string("alma"), value.isNaN {} else { XCTFail() }
        
        if case .double(let value) = leftValue * ["alma", 1, 3.14], value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue * ["string": "alma", "int": 123], value.isNaN {} else { XCTFail() }

        leftValue = false

        XCTAssertEqual( leftValue * .null, SoyValue.integer(0) )
        XCTAssertEqual( leftValue * .bool(true), .integer(0) )
        XCTAssertEqual( leftValue * .bool(false), .integer(0) )

        XCTAssertEqual( leftValue * .integer(123), .integer(0) )
        XCTAssertEqual( leftValue * .double(3.14), .double(0) )
        if case .double(let value) = leftValue * .double(.nan), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue * .double(.infinity), value.isNaN {} else { XCTFail() }

        XCTAssertEqual( leftValue * .string("123"), .integer(0))
        XCTAssertEqual( leftValue * .string("3.14"), .double(0))
        if case .double(let value) = leftValue * .string("alma"), value.isNaN {} else { XCTFail() }

        if case .double(let value) = leftValue * ["alma", 1, 3.14], value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue * ["string": "alma", "int": 123], value.isNaN {} else { XCTFail() }
    }

    func testMultiplyWithIntegerValue() {
        let leftValue: SoyValue = 123

        XCTAssertEqual( leftValue * .null, .integer(0) )
        XCTAssertEqual( leftValue * .bool(true), .integer(123) )
        XCTAssertEqual( leftValue * .bool(false), .integer(0) )

        XCTAssertEqual( leftValue * .integer(123), .integer(123*123) )
        XCTAssertEqual( leftValue * .double(3.14), .double(123*3.14) )
        if case .double(let value) = leftValue * .double(.nan), value.isNaN {} else { XCTFail() }
        XCTAssertEqual( leftValue * .double(.infinity), .double(.infinity) )

        XCTAssertEqual( leftValue * .string("123"), .integer(123*123))
        XCTAssertEqual( leftValue * .string("3.14"), .double(123*3.14))
        if case .double(let value) = leftValue * .string("alma"), value.isNaN {} else { XCTFail() }

        if case .double(let value) = leftValue * ["alma", 1, 3.14], value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue * ["string": "alma", "int": 123], value.isNaN {} else { XCTFail() }
    }

    func testMultiplyWithDoubleValue() {
        let leftValue: SoyValue = 3.14
        
        XCTAssertEqual( leftValue * .null, .double(0) )
        XCTAssertEqual( leftValue * .bool(true), .double(3.14) )
        XCTAssertEqual( leftValue * .bool(false), .double(0) )

        XCTAssertEqual( leftValue * .integer(123), .double(3.14*123) )
        XCTAssertEqual( leftValue * .double(3.14), .double(3.14*3.14) )
        if case .double(let value) = leftValue * .double(.nan), value.isNaN {} else { XCTFail() }
        XCTAssertEqual( leftValue * .double(.infinity), .double(Double.infinity) )

        XCTAssertEqual( leftValue * .string("123"), .double(3.14*123))
        XCTAssertEqual( leftValue * .string("3.14"), .double(3.14*3.14))
        if case .double(let value) = leftValue * .string("alma"), value.isNaN {} else { XCTFail() }

        if case .double(let value) = leftValue * ["alma", 1, 3.14], value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue * ["string": "alma", "int": 123], value.isNaN {} else { XCTFail() }
    }

    func testMultiplyWithNaNValue() {
        let leftValue: SoyValue = .double(Double.nan)
        
        if case .double(let value) = leftValue * .null, value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue * .bool(true), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue * .bool(true), value.isNaN {} else { XCTFail() }

        if case .double(let value) = leftValue * .integer(123), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue * .double(3.14), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue * .double(.nan), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue * .double(.infinity), value.isNaN {} else { XCTFail() }

        if case .double(let value) = leftValue * .string("123"), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue * .string("3.14"), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue * .string("alma"), value.isNaN {} else { XCTFail() }

        if case .double(let value) = leftValue * ["alma", 1, 3.14], value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue * ["string": "alma", "int": 123], value.isNaN {} else { XCTFail() }
    }

    func testMultiplyWithInfinityValue() {
        let leftValue: SoyValue = .double(Double.infinity)
        let expectedValue = leftValue

        if case .double(let value) = leftValue * .null, value.isNaN {} else { XCTFail() }
        XCTAssertEqual( leftValue * .bool(true), expectedValue )
        if case .double(let value) = leftValue * .bool(false), value.isNaN {} else { XCTFail() }
 
        XCTAssertEqual( leftValue * .integer(123), expectedValue )
        XCTAssertEqual( leftValue * .double(3.14), expectedValue )
        if case .double(let value) = leftValue * .double(.nan), value.isNaN {} else { XCTFail() }
        XCTAssertEqual( leftValue * .double(.infinity), expectedValue )

        XCTAssertEqual( leftValue * .string("123"), expectedValue)
        XCTAssertEqual( leftValue * .string("3.14"), expectedValue)
        if case .double(let value) = leftValue * .string("alma"), value.isNaN {} else { XCTFail() }

        if case .double(let value) = leftValue * ["alma", 1, 3.14], value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue * ["string": "alma", "int": 123], value.isNaN {} else { XCTFail() }
    }

    func testMultiplyWithStringValue() {
        let leftValue: SoyValue = "alma"

        if case .double(let value) = leftValue * .null, value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue * .bool(true), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue * .bool(true), value.isNaN {} else { XCTFail() }

        if case .double(let value) = leftValue * .integer(123), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue * .double(3.14), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue * .double(.nan), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue * .double(.infinity), value.isNaN {} else { XCTFail() }

        if case .double(let value) = leftValue * .string("123"), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue * .string("3.14"), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue * .string("alma"), value.isNaN {} else { XCTFail() }

        if case .double(let value) = leftValue * ["alma", 1, 3.14], value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue * ["string": "alma", "int": 123], value.isNaN {} else { XCTFail() }
    }

    // FIXME write test case for multiplying string containing integer number

    // FIXME write test case for multiplying string containing floating point number

    func testMultiplyWithEmptyArrayValue() {
        // NOTE: empty array acts as zero number
        let leftValue: SoyValue = []

        XCTAssertEqual( leftValue * .null, .integer(0) )
        XCTAssertEqual( leftValue * .bool(true), .integer(0) )
        XCTAssertEqual( leftValue * .bool(false), .integer(0) )

        XCTAssertEqual( leftValue * .integer(123), .integer(0) )
        XCTAssertEqual( leftValue * .double(3.14), .double(0) )
        if case .double(let value) = leftValue * .double(.nan), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue * .double(.infinity), value.isNaN {} else { XCTFail() }

        XCTAssertEqual( leftValue * .string("123"), .integer(0))
        XCTAssertEqual( leftValue * .string("3.14"), .double(0))
        if case .double(let value) = leftValue * .string("alma"), value.isNaN {} else { XCTFail() }

        if case .double(let value) = leftValue * ["alma", 1, 3.14], value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue * ["string": "alma", "int": 123], value.isNaN {} else { XCTFail() }
    }

    func testMultiplyWithArrayValue() {
        let leftValue: SoyValue = ["alma", 1, 3.14]

        if case .double(let value) = leftValue * .null, value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue * .bool(true), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue * .bool(true), value.isNaN {} else { XCTFail() }

        if case .double(let value) = leftValue * .integer(123), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue * .double(3.14), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue * .double(.nan), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue * .double(.infinity), value.isNaN {} else { XCTFail() }

        if case .double(let value) = leftValue * .string("123"), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue * .string("3.14"), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue * .string("alma"), value.isNaN {} else { XCTFail() }

        if case .double(let value) = leftValue * ["alma", 1, 3.14], value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue * ["string": "alma", "int": 123], value.isNaN {} else { XCTFail() }
    }

    func testMultiplyWithMapValue() {
        let leftValue: SoyValue = ["alma": 1, "korte": 3.14, "cseresznye": true]

        if case .double(let value) = leftValue * .null, value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue * .bool(true), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue * .bool(true), value.isNaN {} else { XCTFail() }

        if case .double(let value) = leftValue * .integer(123), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue * .double(3.14), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue * .double(.nan), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue * .double(.infinity), value.isNaN {} else { XCTFail() }

        if case .double(let value) = leftValue * .string("123"), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue * .string("3.14"), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue * .string("alma"), value.isNaN {} else { XCTFail() }

        if case .double(let value) = leftValue * ["alma", 1, 3.14], value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue * ["string": "alma", "int": 123], value.isNaN {} else { XCTFail() }
    }
}
