import XCTest
@testable import ElsevierKit

final class ElsevierKitTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(ElsevierKit().text, "Hello, World!")
    }


    static var allTests = [
        ("testExample", testExample),
    ]
}
