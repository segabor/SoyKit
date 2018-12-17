#if !canImport(ObjectiveC)
import XCTest

extension DictionaryTests {
    // DO NOT MODIFY: This is autogenerated, use: 
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__DictionaryTests = [
        ("testGetter", testGetter),
    ]
}

extension MinusOperatorTests {
    // DO NOT MODIFY: This is autogenerated, use: 
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__MinusOperatorTests = [
        ("testSubstractFromArrayValue", testSubstractFromArrayValue),
        ("testSubstractFromBoolValue", testSubstractFromBoolValue),
        ("testSubstractFromDoubleValue", testSubstractFromDoubleValue),
        ("testSubstractFromInfinityValue", testSubstractFromInfinityValue),
        ("testSubstractFromIntegerValue", testSubstractFromIntegerValue),
        ("testSubstractFromMapValue", testSubstractFromMapValue),
        ("testSubstractFromNaNValue", testSubstractFromNaNValue),
        ("testSubstractFromNullValue", testSubstractFromNullValue),
        ("testSubstractFromStringValue", testSubstractFromStringValue),
    ]
}

extension ModOperatorTests {
    // DO NOT MODIFY: This is autogenerated, use: 
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__ModOperatorTests = [
        ("testModuloWithArrayValue", testModuloWithArrayValue),
        ("testModuloWithBoolValue", testModuloWithBoolValue),
        ("testModuloWithDoubleValue", testModuloWithDoubleValue),
        ("testModuloWithEmptyArrayValue", testModuloWithEmptyArrayValue),
        ("testModuloWithInfinityValue", testModuloWithInfinityValue),
        ("testModuloWithIntegerValue", testModuloWithIntegerValue),
        ("testModuloWithMapValue", testModuloWithMapValue),
        ("testModuloWithNaNValue", testModuloWithNaNValue),
        ("testModuloWithNullValue", testModuloWithNullValue),
        ("testModuloWithStringValue", testModuloWithStringValue),
    ]
}

extension PlusOperatorTests {
    // DO NOT MODIFY: This is autogenerated, use: 
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__PlusOperatorTests = [
        ("testAddToArrayValue", testAddToArrayValue),
        ("testAddToBoolValue", testAddToBoolValue),
        ("testAddToDoubleValue", testAddToDoubleValue),
        ("testAddToInfinityValue", testAddToInfinityValue),
        ("testAddToIntegerValue", testAddToIntegerValue),
        ("testAddToMapValue", testAddToMapValue),
        ("testAddToNaNValue", testAddToNaNValue),
        ("testAddToNullValue", testAddToNullValue),
        ("testAddToStringValue", testAddToStringValue),
    ]
}

extension SanitizerTests {
    // DO NOT MODIFY: This is autogenerated, use: 
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__SanitizerTests = [
        ("testCleanHtml", testCleanHtml),
        ("testTagWhitelisting", testTagWhitelisting),
    ]
}

extension SlashOperatorTests {
    // DO NOT MODIFY: This is autogenerated, use: 
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__SlashOperatorTests = [
        ("testDivideByArrayValue", testDivideByArrayValue),
        ("testDivideByBoolValue", testDivideByBoolValue),
        ("testDivideByDoubleValue", testDivideByDoubleValue),
        ("testDivideByEmptyArrayValue", testDivideByEmptyArrayValue),
        ("testDivideByInfinityValue", testDivideByInfinityValue),
        ("testDivideByIntegerValue", testDivideByIntegerValue),
        ("testDivideByMapValue", testDivideByMapValue),
        ("testDivideByNaNValue", testDivideByNaNValue),
        ("testDivideByNullValue", testDivideByNullValue),
        ("testDivideByStringValue", testDivideByStringValue),
    ]
}

extension TimesOperatorTests {
    // DO NOT MODIFY: This is autogenerated, use: 
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__TimesOperatorTests = [
        ("testMultiplyWithArrayValue", testMultiplyWithArrayValue),
        ("testMultiplyWithBoolValue", testMultiplyWithBoolValue),
        ("testMultiplyWithDoubleValue", testMultiplyWithDoubleValue),
        ("testMultiplyWithEmptyArrayValue", testMultiplyWithEmptyArrayValue),
        ("testMultiplyWithInfinityValue", testMultiplyWithInfinityValue),
        ("testMultiplyWithIntegerValue", testMultiplyWithIntegerValue),
        ("testMultiplyWithMapValue", testMultiplyWithMapValue),
        ("testMultiplyWithNaNValue", testMultiplyWithNaNValue),
        ("testMultiplyWithNullValue", testMultiplyWithNullValue),
        ("testMultiplyWithStringValue", testMultiplyWithStringValue),
    ]
}

public func __allTests() -> [XCTestCaseEntry] {
    return [
        testCase(DictionaryTests.__allTests__DictionaryTests),
        testCase(MinusOperatorTests.__allTests__MinusOperatorTests),
        testCase(ModOperatorTests.__allTests__ModOperatorTests),
        testCase(PlusOperatorTests.__allTests__PlusOperatorTests),
        testCase(SanitizerTests.__allTests__SanitizerTests),
        testCase(SlashOperatorTests.__allTests__SlashOperatorTests),
        testCase(TimesOperatorTests.__allTests__TimesOperatorTests),
    ]
}
#endif
