import XCTest
@testable import SoyTests

var tests = [XCTestCaseEntry]()
tests += SanitizerTests.allTests()
tests += PlusOperatorTests.allTests()
XCTMain(tests)
