import XCTest
@testable import SoyTests

#if !os(macOS)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(SanitizerTests.allTests),
        testCase(PlusOperatorTests.allTests)
    ]
}
#endif
