//
//  AddOperatorTests.swift
//  SoyKit
//
//  Created by Sebestyén Gábor on 2018. 11. 26..
//

import XCTest
@testable import SoyKit

class MinusOperatorTests: XCTestCase {
    func testSubstractFromNullValue() {
        let leftValue: SoyValue = nil

        XCTAssertEqual( leftValue - .null, SoyValue.integer(0) )
        XCTAssertEqual( leftValue - .bool(true), SoyValue.integer(-1) )
        XCTAssertEqual( leftValue - .bool(false), SoyValue.integer(0) )

        XCTAssertEqual( leftValue - .integer(123), SoyValue.integer(-123) )
        XCTAssertEqual( leftValue - .double(3.14), SoyValue.double(-3.14) )
        if case .double(let value) = leftValue - .double(Double.nan), value.isNaN {} else { XCTFail() }
        XCTAssertEqual( leftValue - .double(Double.infinity), .double(-.infinity) )
        
        if case .double(let value) = leftValue - ["alma", 1, 3.14], value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue - ["string": "alma", "int": 123], value.isNaN {} else { XCTFail() }
    }

    func testSubstractFromBoolValue() {
        var leftValue: SoyValue = true

        XCTAssertEqual( leftValue - .null, .integer(1) )
        XCTAssertEqual( leftValue - .bool(true), .integer(0) )
        XCTAssertEqual( leftValue - .bool(false), .integer(1) )

        XCTAssertEqual( leftValue - .integer(123), .integer(-122) )
        XCTAssertEqual( leftValue - .double(3.14), .double(-2.14) )
        if case .double(let value) = leftValue - .double(.nan), value.isNaN {} else { XCTFail() }
        XCTAssertEqual( leftValue - .double(Double.infinity), .double(-.infinity) )

        if case .double(let value) = leftValue - ["alma", 1, 3.14], value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue - ["string": "alma", "int": 123], value.isNaN {} else { XCTFail() }

        leftValue = false

        XCTAssertEqual( leftValue - .null, .integer(0) )
        XCTAssertEqual( leftValue - .bool(true), .integer(-1) )
        XCTAssertEqual( leftValue - .bool(false), .integer(0) )

        XCTAssertEqual( leftValue - .integer(123), .integer(-123) )
        XCTAssertEqual( leftValue - .double(3.14), .double(-3.14) )
        if case .double(let value) = leftValue - .double(.nan), value.isNaN {} else { XCTFail() }
        XCTAssertEqual( leftValue - .double(Double.infinity), .double(-.infinity) )

        if case .double(let value) = leftValue - ["alma", 1, 3.14], value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue - ["string": "alma", "int": 123], value.isNaN {} else { XCTFail() }
    }

    func testSubstractFromIntegerValue() {
        let leftValue: SoyValue = 123

        XCTAssertEqual( leftValue - .null, .integer(123) )
        XCTAssertEqual( leftValue - .bool(true), .integer(122) )
        XCTAssertEqual( leftValue - .bool(false), .integer(123) )

        XCTAssertEqual( leftValue - .integer(123), .integer(0) )
        XCTAssertEqual( leftValue - .double(3.14), .double(119.86) )
        if case .double(let value) = leftValue - .double(Double.nan), value.isNaN {} else { XCTFail() }
        XCTAssertEqual( leftValue - .double(Double.infinity), .double(-.infinity) )

        if case .double(let value) = leftValue - ["alma", 1, 3.14], value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue - ["string": "alma", "int": 123], value.isNaN {} else { XCTFail() }
    }

    func testSubstractFromDoubleValue() {
        let leftValue: SoyValue = 3.14
        
        XCTAssertEqual( leftValue - .null, .double(3.14) )
        XCTAssertEqual( leftValue - .bool(true), .double(2.14) )
        XCTAssertEqual( leftValue - .bool(false), .double(3.14) )

        XCTAssertEqual( leftValue - .integer(123), .double(-119.86) )
        XCTAssertEqual( leftValue - .double(3.14), .double(0) )
        if case .double(let value) = leftValue - .double(Double.nan), value.isNaN {} else { XCTFail() }
        XCTAssertEqual( leftValue - .double(Double.infinity), .double(-.infinity) )

        if case .double(let value) = leftValue - ["alma", 1, 3.14], value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue - ["string": "alma", "int": 123], value.isNaN {} else { XCTFail() }
    }

    func testSubstractFromNaNValue() {
        let leftValue: SoyValue = .double(Double.nan)
        
        if case .double(let value) = leftValue - .null, value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue - .bool(true), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue - .bool(true), value.isNaN {} else { XCTFail() }

        if case .double(let value) = leftValue - .integer(123), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue - .double(3.14), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue - .double(.nan), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue - .double(.infinity), value.isNaN {} else { XCTFail() }

        if case .double(let value) = leftValue - ["alma", 1, 3.14], value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue - ["string": "alma", "int": 123], value.isNaN {} else { XCTFail() }
    }

    func testSubstractFromInfinityValue() {
        var leftValue: SoyValue = .double(.infinity)
        var expectedValue = leftValue

        XCTAssertEqual( leftValue - .null, expectedValue )
        XCTAssertEqual( leftValue - .bool(true), expectedValue )
        XCTAssertEqual( leftValue - .bool(false), expectedValue )
        
        XCTAssertEqual( leftValue - .integer(123), expectedValue )
        XCTAssertEqual( leftValue - .double(3.14), expectedValue )
        if case .double(let value) = leftValue - .double(.nan), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue - .double(.infinity), value.isNaN {} else { XCTFail() }

        if case .double(let value) = leftValue - ["alma", 1, 3.14], value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue - ["string": "alma", "int": 123], value.isNaN {} else { XCTFail() }

        leftValue = .double(-.infinity)
        expectedValue = leftValue

        XCTAssertEqual( leftValue - .null, expectedValue )
        XCTAssertEqual( leftValue - .bool(true), expectedValue )
        XCTAssertEqual( leftValue - .bool(false), expectedValue )

        XCTAssertEqual( leftValue - .integer(123), expectedValue )
        XCTAssertEqual( leftValue - .double(3.14), expectedValue )
        if case .double(let value) = leftValue - .double(.nan), value.isNaN {} else { XCTFail() }
        XCTAssertEqual( leftValue - .double(.infinity), .double(-.infinity) )

        if case .double(let value) = leftValue - ["alma", 1, 3.14], value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue - ["string": "alma", "int": 123], value.isNaN {} else { XCTFail() }
    }

    func testSubstractFromStringValue() {
        let leftValue: SoyValue = "alma"

        if case .double(let value) = leftValue - .null, value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue - .bool(true), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue - .bool(false), value.isNaN {} else { XCTFail() }

        if case .double(let value) = leftValue - .integer(123), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue - .double(3.14), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue - .double(.nan), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue - .double(.infinity), value.isNaN {} else { XCTFail() }

        if case .double(let value) = leftValue - ["alma", 1, 3.14], value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue - ["string": "alma", "int": 123], value.isNaN {} else { XCTFail() }
    }

    func testSubstractFromArrayValue() {
        let leftValue: SoyValue = ["alma", 1, 3.14]

        if case .double(let value) = leftValue - .null, value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue - .bool(true), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue - .bool(false), value.isNaN {} else { XCTFail() }

        if case .double(let value) = leftValue - .integer(123), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue - .double(3.14), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue - .double(.nan), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue - .double(.infinity), value.isNaN {} else { XCTFail() }

        if case .double(let value) = leftValue - ["alma", 1, 3.14], value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue - ["string": "alma", "int": 123], value.isNaN {} else { XCTFail() }
    }

    func testSubstractFromMapValue() {
        let leftValue: SoyValue = ["alma": 1, "korte": 3.14, "cseresznye": true]

        if case .double(let value) = leftValue - .null, value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue - .bool(true), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue - .bool(false), value.isNaN {} else { XCTFail() }

        if case .double(let value) = leftValue - .integer(123), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue - .double(3.14), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue - .double(.nan), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue - .double(.infinity), value.isNaN {} else { XCTFail() }

        if case .double(let value) = leftValue - ["alma", 1, 3.14], value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue - ["string": "alma", "int": 123], value.isNaN {} else { XCTFail() }
    }
}
