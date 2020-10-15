//
//  AppenderTests.swift
//  
//
//  Created by Sebestyén Gábor on 2020. 10. 15..
//

import XCTest
@testable import SoyKit

class AppenderTests: XCTestCase {

    func testHTMLOutputKind() {
        let out = try! AppenderFactory.makeAppender(for: .HTML)

        XCTAssertEqual(.HTML, out.contentKind)
    }

    func testEmptyOutput() {
        let out = try! AppenderFactory.makeAppender(for: .HTML)

        XCTAssertTrue(out.asString().isEmpty)
        XCTAssertTrue(out.asBytes().isEmpty)
    }

    func testEmptyOutputWithAppend() {
        let out = try! AppenderFactory.makeAppender(for: .HTML)

        _ = out.append(string: "")

        XCTAssertTrue(out.asString().isEmpty)
        XCTAssertTrue(out.asBytes().isEmpty)
    }

    func testBasicOutput() {
        let out = try! AppenderFactory.makeAppender(for: .HTML)

        _ = out.append(string: "Hello World")

        XCTAssertEqual("Hello World", out.asString())
        XCTAssertEqual([UInt8]("Hello World".utf8), out.asBytes())
    }
}
