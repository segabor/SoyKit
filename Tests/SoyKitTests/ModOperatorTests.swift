//
//  ModOperatorTests.swift
//  SoyKit
//
//  Created by Sebestyén Gábor on 2018. 12. 01..
//

import XCTest
@testable import SoyKit

class ModOperatorTests: XCTestCase {
    func testModuloWithNullValue() {
        let leftValue: SoyValue = nil

        if case .double(let value) = leftValue % .null, value.isNaN {} else { XCTFail() }
        XCTAssertEqual( leftValue % .bool(true), .integer(0) )
        if case .double(let value) = leftValue % .bool(false), value.isNaN {} else { XCTFail() }

        XCTAssertEqual( leftValue % .integer(123), .integer(0) )
        XCTAssertEqual( leftValue % .double(3.14), .double(0) )
        if case .double(let value) = leftValue % .double(.nan), value.isNaN {} else { XCTFail() }
        XCTAssertEqual( leftValue % .double(.infinity), .double(0) )

        XCTAssertEqual( leftValue % .string("123"), .integer(0))
        XCTAssertEqual( leftValue % .string("3.14"), .double(0))
        if case .double(let value) = leftValue % .string("alma"), value.isNaN {} else { XCTFail() }

        if case .double(let value) = leftValue % ["alma", 1, 3.14], value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue % ["string": "alma", "int": 123], value.isNaN {} else { XCTFail() }
    }

    func testModuloWithBoolValue() {
        var leftValue: SoyValue = true

        if case .double(let value) = leftValue % .null, value.isNaN {} else { XCTFail() }
        XCTAssertEqual( leftValue % .bool(true), .integer(0) )
        if case .double(let value) = leftValue % .bool(false), value.isNaN {} else { XCTFail() }

        XCTAssertEqual( leftValue % .integer(123), .integer(1) )
        XCTAssertEqual( leftValue % .double(3.14), .double(1.0) )
        if case .double(let value) = leftValue % .double(.nan), value.isNaN {} else { XCTFail() }
        XCTAssertEqual( leftValue % .double(.infinity), .double(1.0) )

        XCTAssertEqual( leftValue % .string("123"), .integer(1))
        XCTAssertEqual( leftValue % .string("3.14"), .double(1.0))
        if case .double(let value) = leftValue % .string("alma"), value.isNaN {} else { XCTFail() }

        if case .double(let value) = leftValue % ["alma", 1, 3.14], value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue % ["string": "alma", "int": 123], value.isNaN {} else { XCTFail() }

        leftValue = false

        if case .double(let value) = leftValue % .null, value.isNaN {} else { XCTFail() }
        XCTAssertEqual( leftValue % .bool(true), .integer(0) )
        if case .double(let value) = leftValue % .bool(false), value.isNaN {} else { XCTFail() }

        XCTAssertEqual( leftValue % .integer(123), .integer(0) )
        XCTAssertEqual( leftValue % .double(3.14), .double(0) )
        if case .double(let value) = leftValue % .double(.nan), value.isNaN {} else { XCTFail() }
        XCTAssertEqual( leftValue % .double(.infinity), .double(0.0) )

        XCTAssertEqual( leftValue % .string("123"), .integer(0))
        XCTAssertEqual( leftValue % .string("3.14"), .double(0))
        if case .double(let value) = leftValue % .string("alma"), value.isNaN {} else { XCTFail() }

        if case .double(let value) = leftValue % ["alma", 1, 3.14], value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue % ["string": "alma", "int": 123], value.isNaN {} else { XCTFail() }
    }

    func testModuloWithIntegerValue() {
        let leftValue: SoyValue = 123

        if case .double(let value) = leftValue % .null, value.isNaN {} else { XCTFail() }
        XCTAssertEqual( leftValue % .bool(true), .integer(0) )
        if case .double(let value) = leftValue % .bool(false), value.isNaN {} else { XCTFail() }

        XCTAssertEqual( leftValue % .integer(123), .integer(123%123) )
        XCTAssertEqual( leftValue % .double(3.14), .double(123.truncatingRemainder(dividingBy: 3.14)) )
        if case .double(let value) = leftValue % .double(.nan), value.isNaN {} else { XCTFail() }
        XCTAssertEqual( leftValue % .double(.infinity), .double(123.0) )

        XCTAssertEqual( leftValue % .string("123"), .integer(123%123))
        XCTAssertEqual( leftValue % .string("3.14"), .double(123.truncatingRemainder(dividingBy: 3.14)) )
        if case .double(let value) = leftValue % .string("alma"), value.isNaN {} else { XCTFail() }

        if case .double(let value) = leftValue % ["alma", 1, 3.14], value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue % ["string": "alma", "int": 123], value.isNaN {} else { XCTFail() }
    }

    func testModuloWithDoubleValue() {
        let leftValue: SoyValue = 3.14

        if case .double(let value) = leftValue % .null, value.isNaN {} else { XCTFail() }
        XCTAssertEqual( leftValue % .bool(true), .double(3.14.truncatingRemainder(dividingBy: 1)) )
        if case .double(let value) = leftValue % .bool(false), value.isNaN {} else { XCTFail() }

        XCTAssertEqual( leftValue % .integer(123), .double(3.14.truncatingRemainder(dividingBy: 123)) )
        XCTAssertEqual( leftValue % .double(3.14), .double(3.14.truncatingRemainder(dividingBy: 3.14)) )
        if case .double(let value) = leftValue % .double(.nan), value.isNaN {} else { XCTFail() }
        XCTAssertEqual( leftValue % .double(.infinity), .double(3.14) )

        XCTAssertEqual( leftValue % .string("123"), .double(3.14.truncatingRemainder(dividingBy: 123)) )
        XCTAssertEqual( leftValue % .string("3.14"), .double(3.14.truncatingRemainder(dividingBy: 3.14)) ) 
        if case .double(let value) = leftValue % .string("alma"), value.isNaN {} else { XCTFail() }

        if case .double(let value) = leftValue % ["alma", 1, 3.14], value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue % ["string": "alma", "int": 123], value.isNaN {} else { XCTFail() }
    }

    func testModuloWithNaNValue() {
        let leftValue: SoyValue = .double(Double.nan)

        if case .double(let value) = leftValue % .null, value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue % .bool(true), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue % .bool(true), value.isNaN {} else { XCTFail() }

        if case .double(let value) = leftValue % .integer(123), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue % .double(3.14), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue % .double(.nan), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue % .double(.infinity), value.isNaN {} else { XCTFail() }

        if case .double(let value) = leftValue % .string("123"), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue % .string("3.14"), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue % .string("alma"), value.isNaN {} else { XCTFail() }

        if case .double(let value) = leftValue % ["alma", 1, 3.14], value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue % ["string": "alma", "int": 123], value.isNaN {} else { XCTFail() }
    }

    func testModuloWithInfinityValue() {
        let leftValue: SoyValue = .double(.infinity)

        if case .double(let value) = leftValue % .null, value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue % .bool(true), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue % .bool(false), value.isNaN {} else { XCTFail() }

        if case .double(let value) = leftValue % .integer(123), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue % .double(3.14), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue % .double(.nan), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue % .double(.infinity), value.isNaN {} else { XCTFail() }

        if case .double(let value) = leftValue % .string("123"), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue % .string("3.14"), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue % .string("alma"), value.isNaN {} else { XCTFail() }

        if case .double(let value) = leftValue % ["alma", 1, 3.14], value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue % ["string": "alma", "int": 123], value.isNaN {} else { XCTFail() }
    }

    func testModuloWithStringValue() {
        let leftValue: SoyValue = "alma"

        if case .double(let value) = leftValue % .null, value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue % .bool(true), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue % .bool(true), value.isNaN {} else { XCTFail() }

        if case .double(let value) = leftValue % .integer(123), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue % .double(3.14), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue % .double(.nan), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue % .double(.infinity), value.isNaN {} else { XCTFail() }

        if case .double(let value) = leftValue % .string("123"), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue % .string("3.14"), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue % .string("alma"), value.isNaN {} else { XCTFail() }

        if case .double(let value) = leftValue % ["alma", 1, 3.14], value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue % ["string": "alma", "int": 123], value.isNaN {} else { XCTFail() }
    }

    // FIXME write test case for multiplying string containing integer number

    // FIXME write test case for multiplying string containing floating point number

    func testModuloWithEmptyArrayValue() {
        // NOTE: empty array acts as zero number
        let leftValue: SoyValue = []

        if case .double(let value) = leftValue % .null, value.isNaN {} else { XCTFail() }
        XCTAssertEqual( leftValue % .bool(true), .integer(0) )
        if case .double(let value) = leftValue % .bool(false), value.isNaN {} else { XCTFail() }

        XCTAssertEqual( leftValue % .integer(123), .integer(0) )
        XCTAssertEqual( leftValue % .double(3.14), .double(0) )
        if case .double(let value) = leftValue % .double(.nan), value.isNaN {} else { XCTFail() }
        XCTAssertEqual( leftValue % .double(.infinity), .double(0) )

        XCTAssertEqual( leftValue % .string("123"), .integer(0))
        XCTAssertEqual( leftValue % .string("3.14"), .double(0))
        if case .double(let value) = leftValue % .string("alma"), value.isNaN {} else { XCTFail() }

        if case .double(let value) = leftValue % ["alma", 1, 3.14], value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue % ["string": "alma", "int": 123], value.isNaN {} else { XCTFail() }
    }

    func testModuloWithArrayValue() {
        let leftValue: SoyValue = ["alma", 1, 3.14]

        if case .double(let value) = leftValue % .null, value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue % .bool(true), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue % .bool(true), value.isNaN {} else { XCTFail() }

        if case .double(let value) = leftValue % .integer(123), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue % .double(3.14), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue % .double(.nan), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue % .double(.infinity), value.isNaN {} else { XCTFail() }

        if case .double(let value) = leftValue % .string("123"), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue % .string("3.14"), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue % .string("alma"), value.isNaN {} else { XCTFail() }

        if case .double(let value) = leftValue % ["alma", 1, 3.14], value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue % ["string": "alma", "int": 123], value.isNaN {} else { XCTFail() }
    }

    func testModuloWithMapValue() {
        let leftValue: SoyValue = ["alma": 1, "korte": 3.14, "cseresznye": true]

        if case .double(let value) = leftValue % .null, value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue % .bool(true), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue % .bool(true), value.isNaN {} else { XCTFail() }

        if case .double(let value) = leftValue % .integer(123), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue % .double(3.14), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue % .double(.nan), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue % .double(.infinity), value.isNaN {} else { XCTFail() }

        if case .double(let value) = leftValue % .string("123"), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue % .string("3.14"), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue % .string("alma"), value.isNaN {} else { XCTFail() }

        if case .double(let value) = leftValue % ["alma", 1, 3.14], value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue % ["string": "alma", "int": 123], value.isNaN {} else { XCTFail() }
    }
}
