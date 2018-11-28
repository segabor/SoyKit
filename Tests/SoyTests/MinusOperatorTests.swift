//
//  AddOperatorTests.swift
//  Soy
//
//  Created by Sebestyén Gábor on 2018. 11. 26..
//

import XCTest
@testable import Soy

class MinusOperatorTests: XCTestCase {
    func testSubstractFromNullValue() {
        let leftValue: SoyValue = nil

        XCTAssertEqual( leftValue - .null, SoyValue.integer(0) )
        XCTAssertEqual( leftValue - .bool(true), SoyValue.integer(1) )
        XCTAssertEqual( leftValue - .bool(false), SoyValue.integer(0) )

        XCTAssertEqual( leftValue - .integer(123), SoyValue.integer(123) )
        XCTAssertEqual( leftValue - .double(3.14), SoyValue.double(3.14) )
        if case .double(let value) = leftValue - .double(Double.nan), value.isNaN {} else { XCTFail() }
        XCTAssertEqual( leftValue - .double(Double.infinity), .double(.infinity) )
        
        XCTAssertEqual( leftValue - ["alma", 1, 3.14], .string("nullalma,1,3.14") )
        XCTAssertEqual( leftValue - ["string": "alma", "int": 123], .string("null[object Object]") )
    }

    func testSubstractFromBoolValue() {
        var leftValue: SoyValue = true

        XCTAssertEqual( SoyValue.integer(leftValue.coerceToInteger - SoyValue.null.coerceToInteger), SoyValue.integer(1) )
        XCTAssertEqual( leftValue - .bool(true), .integer(2) )
        XCTAssertEqual( leftValue - .bool(false), .integer(1) )
        
        XCTAssertEqual( leftValue - .integer(123), .integer(124) )
        XCTAssertEqual( leftValue - .double(3.14), .double(4.140000000000001) )
        XCTAssertEqual( leftValue - .double(Double.nan), .string("trueNaN") )
        XCTAssertEqual( leftValue - .double(Double.infinity), .string("trueInfinity") )
        
        XCTAssertEqual( leftValue - ["alma", 1, 3.14], .string("truealma,1,3.14") )
        XCTAssertEqual( leftValue - ["string": "alma", "int": 123], .string("true[object Object]") )

        leftValue = false

        XCTAssertEqual( SoyValue.integer(leftValue.coerceToInteger - SoyValue.null.coerceToInteger), SoyValue.integer(0) )
        XCTAssertEqual( leftValue - .bool(true), .integer(1) )
        XCTAssertEqual( leftValue - .bool(false), .integer(0) )

        XCTAssertEqual( leftValue - .integer(123), .integer(123) )
        XCTAssertEqual( leftValue - .double(3.14), .double(3.14) )
        XCTAssertEqual( leftValue - .double(Double.nan), .string("falseNaN") )
        XCTAssertEqual( leftValue - .double(Double.infinity), .string("falseInfinity") )
        
        XCTAssertEqual( leftValue - ["alma", 1, 3.14], .string("falsealma,1,3.14") )
        XCTAssertEqual( leftValue - ["string": "alma", "int": 123], .string("false[object Object]") )
    }

    func testSubstractFromIntegerValue() {
        let leftValue: SoyValue = 123

        XCTAssertEqual( leftValue - .null, .integer(123) )
        XCTAssertEqual( leftValue - .bool(true), .integer(124) )
        XCTAssertEqual( leftValue - .bool(false), .integer(123) )

        XCTAssertEqual( leftValue - .integer(123), .integer(246) )
        XCTAssertEqual( leftValue - .double(3.14), .double(126.14) )
        if case .double(let value) = leftValue - .double(Double.nan), value.isNaN {} else { XCTFail() }
        XCTAssertEqual( leftValue - .double(Double.infinity), .double(Double.infinity) )

        XCTAssertEqual( leftValue - ["alma", 1, 3.14], .string("123alma,1,3.14") )
        XCTAssertEqual( leftValue - ["string": "alma", "int": 123], .string("123[object Object]") )
    }

    func testSubstractFromDoubleValue() {
        let leftValue: SoyValue = 3.14
        
        XCTAssertEqual( leftValue - .null, .double(3.14) )
        XCTAssertEqual( leftValue - .bool(true), .double(4.140000000000001) )
        XCTAssertEqual( leftValue - .bool(false), .double(3.14) )

        XCTAssertEqual( leftValue - .integer(123), .double(126.14) )
        XCTAssertEqual( leftValue - .double(3.14), .double(6.28) )
        if case .double(let value) = leftValue - .double(Double.nan), value.isNaN {} else { XCTFail() }
        XCTAssertEqual( leftValue - .double(Double.infinity), .double(Double.infinity) )

        XCTAssertEqual( leftValue - ["alma", 1, 3.14], .string("3.14alma,1,3.14") )
        XCTAssertEqual( leftValue - ["string": "alma", "int": 123], .string("3.14[object Object]") )
    }

    func testSubstractFromNaNValue() {
        let leftValue: SoyValue = .double(Double.nan)
        
        if case .double(let value) = leftValue - .null, value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue - .bool(true), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue - .bool(true), value.isNaN {} else { XCTFail() }

        if case .double(let value) = leftValue - .integer(123), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue - .double(3.14), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue - .double(Double.nan), value.isNaN {} else { XCTFail() }
        if case .double(let value) = leftValue - .double(Double.infinity), value.isNaN {} else { XCTFail() }

        XCTAssertEqual( leftValue - ["alma", 1, 3.14], .string("NaNalma,1,3.14") )
        XCTAssertEqual( leftValue - ["string": "alma", "int": 123], .string("NaN[object Object]") )
    }

    func testSubstractFromInfinityValue() {
        let leftValue: SoyValue = .double(Double.infinity)
        let expectedValue = leftValue

        XCTAssertEqual( leftValue - .null, expectedValue )
        XCTAssertEqual( leftValue - .bool(true), expectedValue )
        XCTAssertEqual( leftValue - .bool(false), expectedValue )
        
        XCTAssertEqual( leftValue - .integer(123), expectedValue )
        XCTAssertEqual( leftValue - .double(3.14), expectedValue )
        if case .double(let value) = leftValue - .double(Double.nan), value.isNaN {} else { XCTFail() }
        XCTAssertEqual( leftValue - .double(Double.infinity), expectedValue )

        XCTAssertEqual( leftValue - ["alma", 1, 3.14], .string("Infinityalma,1,3.14") )
        XCTAssertEqual( leftValue - ["string": "alma", "int": 123], .string("Infinity[object Object]") )
    }

    func testSubstractFromStringValue() {
        let leftValue: SoyValue = "alma"

        XCTAssertEqual( leftValue - .null, .string("almanull") )
        XCTAssertEqual( leftValue - .bool(true), .string("almatrue") )
        XCTAssertEqual( leftValue - .bool(false), .string("almafalse") )

        XCTAssertEqual( leftValue - .integer(123), .string("alma123") )
        XCTAssertEqual( leftValue - .double(3.14), .string("alma3.14") )
        XCTAssertEqual( leftValue - .double(Double.nan), .string("almaNaN") )
        XCTAssertEqual( leftValue - .double(Double.infinity), .string("almaInfinity") )

        XCTAssertEqual( leftValue - ["alma", 1, 3.14], .string("almaalma,1,3.14") )
        XCTAssertEqual( leftValue - ["string": "alma", "int": 123], .string("alma[object Object]") )
    }

    func testSubstractFromArrayValue() {
        let leftValue: SoyValue = ["alma", 1, 3.14]

        XCTAssertEqual( leftValue - .null, .string("alma,1,3.14null") )
        XCTAssertEqual( leftValue - .bool(true), .string("alma,1,3.14true") )
        XCTAssertEqual( leftValue - .bool(false), .string("alma,1,3.14false") )

        XCTAssertEqual( leftValue - .integer(123), .string("alma,1,3.14123") )
        XCTAssertEqual( leftValue - .double(3.14), .string("alma,1,3.143.14") )
        XCTAssertEqual( leftValue - .double(Double.nan), .string("alma,1,3.14NaN") )
        XCTAssertEqual( leftValue - .double(Double.infinity), .string("alma,1,3.14Infinity") )

        XCTAssertEqual( leftValue - ["korte", 2, 4.14], .array(["alma", 1 , 3.14 , "korte", 2, 4.14]) )
        XCTAssertEqual( leftValue - ["string": "alma", "int": 123], .string("alma,1,3.14[object Object]") )
    }

    func testSubstractFromMapValue() {
        let leftValue: SoyValue = ["alma": 1, "korte": 3.14, "cseresznye": true]

        XCTAssertEqual( leftValue - .null, .string("[object Object]null") )
        XCTAssertEqual( leftValue - .bool(true), .string("[object Object]true") )
        XCTAssertEqual( leftValue - .bool(false), .string("[object Object]false") )

        XCTAssertEqual( leftValue - .integer(123), .string("[object Object]123") )
        XCTAssertEqual( leftValue - .double(3.14), .string("[object Object]3.14") )
        XCTAssertEqual( leftValue - .double(Double.nan), .string("[object Object]NaN") )
        XCTAssertEqual( leftValue - .double(Double.infinity), .string("[object Object]Infinity") )

        XCTAssertEqual( leftValue - ["korte", 2, 4.14], .string("[object Object]korte,2,4.14") )
        XCTAssertEqual( leftValue - ["string": "alma", "int": 123], .string("[object Object][object Object]") )
    }
}
