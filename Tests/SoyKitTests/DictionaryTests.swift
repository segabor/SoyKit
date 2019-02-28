//
//  DictionaryTests.swift
//  SoyKit
//
//  Created by Sebestyén Gábor on 2018. 12. 05..
//

import XCTest
@testable import SoyKit

class DictionaryTests: XCTestCase {
    func testGetter() {
        let testDict: [String: SoyValue] = ["bool": true, "number": 123, "array": [1, 2, 3]]

        XCTAssertTrue(testDict.get("bool") != .null)
        XCTAssertTrue(testDict.get("number") != .null)
        XCTAssertTrue(testDict.get("array") != .null)

        XCTAssertTrue(testDict.get("animal") == .null)
    }
}
