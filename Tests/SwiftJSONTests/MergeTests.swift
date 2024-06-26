//  MergeTests.swift
//
//  Created by Daniel Kiedrowski on 17.11.16.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

import XCTest
import kSwiftyJSON

class MergeTests: XCTestCase {

    func testDifferingTypes() {
        let A = JSON("a")
        let B = JSON(1)

        do {
            _ = try A.merged(with: B)
        } catch let error as SwiftyJSONError {
            XCTAssertEqual(error.errorCode, SwiftyJSONError.wrongType.rawValue)
            XCTAssertEqual(type(of: error).errorDomain, SwiftyJSONError.errorDomain)
            XCTAssertEqual(error.errorUserInfo as! [String: String], [NSLocalizedDescriptionKey: "Couldn't merge, because the JSONs differ in type on top level."])
        } catch _ {}
    }

    func testPrimitiveType() {
        let A = JSON("a")
        let B = JSON("b")
        XCTAssertEqual(try! A.merged(with: B), B)
    }

    func testMergeEqual() {
        let json = JSON(["a": "A"])
        XCTAssertEqual(try! json.merged(with: json), json)
    }

    func testMergeUnequalValues() {
        let A = JSON(["a": "A"])
        let B = JSON(["a": "B"])
        XCTAssertEqual(try! A.merged(with: B), B)
    }

    func testMergeUnequalKeysAndValues() {
        let A = JSON(["a": "A"])
        let B = JSON(["b": "B"])
        XCTAssertEqual(try! A.merged(with: B), JSON(["a": "A", "b": "B"]))
    }

    func testMergeFilledAndEmpty() {
        let A = JSON(["a": "A"])
        let B = JSON([:])
        XCTAssertEqual(try! A.merged(with: B), A)
    }

    func testMergeEmptyAndFilled() {
        let A = JSON([:])
        let B = JSON(["a": "A"])
        XCTAssertEqual(try! A.merged(with: B), B)
    }

    func testMergeArray() {
        let A = JSON(["a"])
        let B = JSON(["b"])
        XCTAssertEqual(try! A.merged(with: B), JSON(["a", "b"]))
    }

    func testMergeNestedJSONs() {
        let A = JSON([
            "nested": [
                "A": "a"
            ]
        ])

        let B = JSON([
            "nested": [
                "A": "b"
            ]
        ])

        XCTAssertEqual(try! A.merged(with: B), B)
    }
}
