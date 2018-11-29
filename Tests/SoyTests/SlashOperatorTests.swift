//
//  SlashOperatorTests
//  Soy
//
//  Created by Sebestyén Gábor on 2018. 11. 26..
//

import XCTest
@testable import Soy

class SlashOperatorTests: XCTestCase {
    func testDivideByNullValue() {
        let leftValue: SoyValue = nil

        if case .double(let value) = leftValue / .null, value.isNaN {} else { XCTFail() }
        XCTAssertEqual( leftValue / .bool(true), .double(0) )
        if case .double(let value) = leftValue / .bool(false), value.isNaN {} else { XCTFail() }

        XCTAssertEqual( leftValue / .double(123), .double(0) )
        XCTAssertEqual( leftValue / .double(3.14), .double(0) )
        if case .double(let value) = leftValue / .double(.nan), value.isNaN {} else { XCTFail() }
        XCTAssertEqual( leftValue / .double(.infinity), .double(0) )

        XCTAssertEqual( leftValue / .string("123"), .double(0))
        XCTAssertEqual( leftValue / .string("3.14"), .double(0))
        if case .double(let value) = leftValue / .string("alma"), value.isNaN {} else { XCTFail() }

        if case .double(let value) = leftValue / ["alma", 1, 3.14], value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue / ["string": "alma", "int": 123], value.isNaN {} else { XCTFail() }
    }

    func testDivideByBoolValue() {
        var leftValue: SoyValue = true

        if case .double(let value) = leftValue / .null, value.isNaN {} else { XCTFail() }
        XCTAssertEqual( leftValue / .bool(true), .double(1) )
        if case .double(let value) = leftValue / .bool(false), value.isNaN {} else { XCTFail() }

        XCTAssertEqual( leftValue / .double(123), .double(1/123) )
        XCTAssertEqual( leftValue / .double(3.14), .double(1/3.14) )
        if case .double(let value) = leftValue / .double(.nan), value.isNaN {} else { XCTFail() }
        XCTAssertEqual( leftValue / .double(.infinity), .double(0) )

        XCTAssertEqual( leftValue / .string("123"), .double(1/123))
        XCTAssertEqual( leftValue / .string("3.14"), .double(1/3.14))
        if case .double(let value) = leftValue / .string("alma"), value.isNaN {} else { XCTFail() }

        if case .double(let value) = leftValue / ["alma", 1, 3.14], value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue / ["string": "alma", "int": 123], value.isNaN {} else { XCTFail() }

        leftValue = false

        if case .double(let value) = leftValue / .null, value.isNaN {} else { XCTFail() }
        XCTAssertEqual( leftValue / .bool(true), .double(0) )
        if case .double(let value) = leftValue / .bool(false), value.isNaN {} else { XCTFail() }

        XCTAssertEqual( leftValue / .double(123), .double(0) )
        XCTAssertEqual( leftValue / .double(3.14), .double(0) )
        if case .double(let value) = leftValue / .double(.nan), value.isNaN {} else { XCTFail() }
        XCTAssertEqual( leftValue / .double(.infinity), .double(0) )

        XCTAssertEqual( leftValue / .string("123"), .double(0))
        XCTAssertEqual( leftValue / .string("3.14"), .double(0))
        if case .double(let value) = leftValue / .string("alma"), value.isNaN {} else { XCTFail() }

        if case .double(let value) = leftValue / ["alma", 1, 3.14], value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue / ["string": "alma", "int": 123], value.isNaN {} else { XCTFail() }
    }

    func testDivideByIntegerValue() {
        let leftValue: SoyValue = 123

        if case .double(let value) = leftValue / .null, value.isNaN {} else { XCTFail() }
        XCTAssertEqual( leftValue / .bool(true), .double(123) )
        if case .double(let value) = leftValue / .bool(false), value.isNaN {} else { XCTFail() }

        XCTAssertEqual( leftValue / .double(123), .double(123/123) )
        XCTAssertEqual( leftValue / .double(3.14), .double(123/3.14) )
        if case .double(let value) = leftValue / .double(.nan), value.isNaN {} else { XCTFail() }
        XCTAssertEqual( leftValue / .double(.infinity), .double(0) )

        XCTAssertEqual( leftValue / .string("123"), .double(123/123))
        XCTAssertEqual( leftValue / .string("3.14"), .double(123/3.14))
        if case .double(let value) = leftValue / .string("alma"), value.isNaN {} else { XCTFail() }

        if case .double(let value) = leftValue / ["alma", 1, 3.14], value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue / ["string": "alma", "int": 123], value.isNaN {} else { XCTFail() }
    }

    func testDivideByDoubleValue() {
        let leftValue: SoyValue = 3.14

        if case .double(let value) = leftValue / .null, value.isNaN {} else { XCTFail() }
        XCTAssertEqual( leftValue / .bool(true), .double(3.14) )
        if case .double(let value) = leftValue / .bool(false), value.isNaN {} else { XCTFail() }

        XCTAssertEqual( leftValue / .double(123), .double(3.14/123) )
        XCTAssertEqual( leftValue / .double(3.14), .double(3.14/3.14) )
        if case .double(let value) = leftValue / .double(.nan), value.isNaN {} else { XCTFail() }
        XCTAssertEqual( leftValue / .double(.infinity), .double(0) )

        XCTAssertEqual( leftValue / .string("123"), .double(3.14/123))
        XCTAssertEqual( leftValue / .string("3.14"), .double(3.14/3.14))
        if case .double(let value) = leftValue / .string("alma"), value.isNaN {} else { XCTFail() }

        if case .double(let value) = leftValue / ["alma", 1, 3.14], value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue / ["string": "alma", "int": 123], value.isNaN {} else { XCTFail() }
    }

    func testDivideByNaNValue() {
        let leftValue: SoyValue = .double(Double.nan)

        if case .double(let value) = leftValue / .null, value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue / .bool(true), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue / .bool(true), value.isNaN {} else { XCTFail() }

        if case .double(let value) = leftValue / .double(123), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue / .double(3.14), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue / .double(.nan), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue / .double(.infinity), value.isNaN {} else { XCTFail() }

        if case .double(let value) = leftValue / .string("123"), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue / .string("3.14"), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue / .string("alma"), value.isNaN {} else { XCTFail() }

        if case .double(let value) = leftValue / ["alma", 1, 3.14], value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue / ["string": "alma", "int": 123], value.isNaN {} else { XCTFail() }
    }

    func testDivideByInfinityValue() {
        let leftValue: SoyValue = .double(.infinity)
        let expectedValue = leftValue

        if case .double(let value) = leftValue / .null, value.isNaN {} else { XCTFail() }
        XCTAssertEqual( leftValue / .bool(true), expectedValue )
        if case .double(let value) = leftValue / .bool(false), value.isNaN {} else { XCTFail() }

        XCTAssertEqual( leftValue / .double(123), expectedValue )
        XCTAssertEqual( leftValue / .double(3.14), expectedValue )
        if case .double(let value) = leftValue / .double(.nan), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue / .double(.infinity), value.isNaN {} else { XCTFail() }

        XCTAssertEqual( leftValue / .string("123"), expectedValue)
        XCTAssertEqual( leftValue / .string("3.14"), expectedValue)
        if case .double(let value) = leftValue / .string("alma"), value.isNaN {} else { XCTFail() }

        if case .double(let value) = leftValue / ["alma", 1, 3.14], value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue / ["string": "alma", "int": 123], value.isNaN {} else { XCTFail() }
    }

    func testDivideByStringValue() {
        let leftValue: SoyValue = "alma"

        if case .double(let value) = leftValue / .null, value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue / .bool(true), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue / .bool(true), value.isNaN {} else { XCTFail() }

        if case .double(let value) = leftValue / .double(123), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue / .double(3.14), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue / .double(.nan), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue / .double(.infinity), value.isNaN {} else { XCTFail() }

        if case .double(let value) = leftValue / .string("123"), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue / .string("3.14"), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue / .string("alma"), value.isNaN {} else { XCTFail() }

        if case .double(let value) = leftValue / ["alma", 1, 3.14], value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue / ["string": "alma", "int": 123], value.isNaN {} else { XCTFail() }
    }

    // FIXME write test case for multiplying string containing integer number

    // FIXME write test case for multiplying string containing floating point number

    func testDivideByEmptyArrayValue() {
        // NOTE: empty array acts as zero number
        let leftValue: SoyValue = []

        if case .double(let value) = leftValue / .null, value.isNaN {} else { XCTFail() }
        XCTAssertEqual( leftValue / .bool(true), .double(0) )
        if case .double(let value) = leftValue / .bool(false), value.isNaN {} else { XCTFail() }

        XCTAssertEqual( leftValue / .double(123), .double(0) )
        XCTAssertEqual( leftValue / .double(3.14), .double(0) )
        if case .double(let value) = leftValue / .double(.nan), value.isNaN {} else { XCTFail() }
        XCTAssertEqual( leftValue / .double(.infinity), .double(0) )

        XCTAssertEqual( leftValue / .string("123"), .double(0))
        XCTAssertEqual( leftValue / .string("3.14"), .double(0))
        if case .double(let value) = leftValue / .string("alma"), value.isNaN {} else { XCTFail() }

        if case .double(let value) = leftValue / ["alma", 1, 3.14], value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue / ["string": "alma", "int": 123], value.isNaN {} else { XCTFail() }
    }

    func testDivideByArrayValue() {
        let leftValue: SoyValue = ["alma", 1, 3.14]

        if case .double(let value) = leftValue / .null, value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue / .bool(true), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue / .bool(true), value.isNaN {} else { XCTFail() }

        if case .double(let value) = leftValue / .double(123), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue / .double(3.14), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue / .double(.nan), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue / .double(.infinity), value.isNaN {} else { XCTFail() }

        if case .double(let value) = leftValue / .string("123"), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue / .string("3.14"), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue / .string("alma"), value.isNaN {} else { XCTFail() }

        if case .double(let value) = leftValue / ["alma", 1, 3.14], value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue / ["string": "alma", "int": 123], value.isNaN {} else { XCTFail() }
    }

    func testDivideByMapValue() {
        let leftValue: SoyValue = ["alma": 1, "korte": 3.14, "cseresznye": true]

        if case .double(let value) = leftValue / .null, value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue / .bool(true), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue / .bool(true), value.isNaN {} else { XCTFail() }

        if case .double(let value) = leftValue / .double(123), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue / .double(3.14), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue / .double(.nan), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue / .double(.infinity), value.isNaN {} else { XCTFail() }

        if case .double(let value) = leftValue / .string("123"), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue / .string("3.14"), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue / .string("alma"), value.isNaN {} else { XCTFail() }

        if case .double(let value) = leftValue / ["alma", 1, 3.14], value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue / ["string": "alma", "int": 123], value.isNaN {} else { XCTFail() }
    }
}
