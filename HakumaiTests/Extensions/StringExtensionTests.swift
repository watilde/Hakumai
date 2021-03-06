//
//  CommonExtensionsTests.swift
//  Hakumai
//
//  Created by Hiroyuki Onishi on 11/17/14.
//  Copyright (c) 2014 Hiroyuki Onishi. All rights reserved.
//

import Foundation
import XCTest

class StringExtensionTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    // MARK: String
    func testExtractRegexpPattern() {
        var pattern: String
        var extracted: String?
        
        pattern = "http:\\/\\/live\\.nicovideo\\.jp\\/watch\\/lv(\\d{5,}).*"
        extracted = "http://live.nicovideo.jp/watch/lv200433812?ref=zero_mynicorepo".extractRegexpPattern(pattern)
        XCTAssert(extracted == "200433812", "")
        
        /*
        pattern = "(http:\\/\\/live\\.nicovideo\\.jp\\/watch\\/)?(lv)?(\\d+).*"
        extracted = "http://live.nicovideo.jp/watch/lv200433812?ref=zero_mynicorepo".extractRegexpPattern(pattern, index: 0)
        XCTAssert(extracted == "200433812", "")
         */
    }
    
    func testHasRegexpPattern() {
        XCTAssert("abc".hasRegexpPattern("b") == true, "")
        XCTAssert("abc".hasRegexpPattern("1") == false, "")
        
        // half-width character with (han)daku-on case. http://stackoverflow.com/a/27192734
        XCTAssert("ﾊﾃﾞｗ".hasRegexpPattern("ｗ") == true, "")
    }
    
    func testStringByRemovingPattern() {
        var removed: String
        
        removed = "abcd".stringByRemovingPattern("bc")
        XCTAssert(removed == "ad", "")
        
        removed = "abcdabcd".stringByRemovingPattern("bc")
        XCTAssert(removed == "adad", "")

        removed = "abc\n".stringByRemovingPattern("\n")
        XCTAssert(removed == "abc", "")
    }
}
