/**
*  HexColor
*  Copyright (c) Wilhelm Oks 2020
*  Licensed under the MIT license (see LICENSE file)
*/

import XCTest
@testable import HexColor

final class HexColorTests: XCTestCase {
    func testIntegerConversion() {
        let color = HexColor.intFromHexString("#f5ab78")
        let colorWithExplicitAlpha = HexColor.intFromHexString("#f5ab78d2")
        let colorWithoutHash = HexColor.intFromHexString("f5ab78")
        let colorWithExplicitAlphaWithoutHash = HexColor.intFromHexString("f5ab78d2")
        let colorUppercase = HexColor.intFromHexString("F5AB78D2")
        let colorDifferentCase = HexColor.intFromHexString("f5ab78D2")
        
        XCTAssertEqual(color, 0xf5ab78ff)
        XCTAssertEqual(colorWithExplicitAlpha, 0xf5ab78d2)
        XCTAssertEqual(colorWithoutHash, 0xf5ab78ff)
        XCTAssertEqual(colorWithExplicitAlphaWithoutHash, 0xf5ab78d2)
        XCTAssertEqual(colorUppercase, 0xf5ab78d2)
        XCTAssertEqual(colorDifferentCase, 0xf5ab78d2)
    }
    
    func testIntegerConversionFromShorthand() {
        let color = HexColor.intFromHexString("#5ad")
        let colorWithExplicitAlpha = HexColor.intFromHexString("#5adc")
        let colorWithoutHash = HexColor.intFromHexString("5ad")
        let colorWithExplicitAlphaWithoutHash = HexColor.intFromHexString("5adc")
        let colorUppercase = HexColor.intFromHexString("5ADC")
        let colorDifferentCase = HexColor.intFromHexString("5AdC")
        
        XCTAssertEqual(color, 0x55aaddff)
        XCTAssertEqual(colorWithExplicitAlpha, 0x55aaddcc)
        XCTAssertEqual(colorWithoutHash, 0x55aaddff)
        XCTAssertEqual(colorWithExplicitAlphaWithoutHash, 0x55aaddcc)
        XCTAssertEqual(colorUppercase, 0x55aaddcc)
        XCTAssertEqual(colorDifferentCase, 0x55aaddcc)
    }
    
    func testIntegerConversionStringInvalid() {
        let color1 = HexColor.intFromHexString("#f5ab78d25")
        let color2 = HexColor.intFromHexString("#f5ab78d")
        let color3 = HexColor.intFromHexString("#f5")
        let color4 = HexColor.intFromHexString("f5")
        let color5 = HexColor.intFromHexString("12345")
        let colorInvalidPrefix = HexColor.intFromHexString("##f5ab78")
        let colorInvalidPrefix2 = HexColor.intFromHexString("##f5ab7")
        let colorInvalidChars = HexColor.intFromHexString("#f5ag78") // g is not valid
        
        XCTAssertNil(color1)
        XCTAssertNil(color2)
        XCTAssertNil(color3)
        XCTAssertNil(color4)
        XCTAssertNil(color5)
        XCTAssertNil(colorInvalidPrefix)
        XCTAssertNil(colorInvalidPrefix2)
        XCTAssertNil(colorInvalidChars)
    }
    
    static var allTests = [
        ("testIntegerConversion", testIntegerConversion),
        ("testIntegerConversionFromShorthand", testIntegerConversionFromShorthand),
        ("testIntegerConversionStringInvalid", testIntegerConversionStringInvalid),
    ]
}
