import XCTest
@testable import ElsevierKit

final class ElsevierKitTests: XCTestCase {
    let timeout: TimeInterval = 60
    var elsevier: ElsevierKit!

    override func setUp() {
        super.setUp()

        self.elsevier = ElsevierKit.shared
        self.elsevier.header = ElsevierHeader(apiKey: Secrets.apiKey)
    }

    func decode<T: Decodable>(_ url: String, model: T.Type) {
        let expect: XCTestExpectation = self.expectation(description: url)

        let success: ElsevierKit.SuccessHandler<T> = { model in
            expect.fulfill()
            XCTAssertNotNil(model)
        }
        let failure: ElsevierKit.FailureHandler = { error in
            expect.fulfill()
            XCTFail(error.localizedDescription)
        }

        self.elsevier.request(url, success: success, failure: failure)
        self.wait(for: [expect], timeout: self.timeout)
    }

    #if RELEASE
    static var allTests = [
        ("testDecodeAuth", testDecodeAuth),
        ("testAuth", testAuth),
        ("testDecodeScienceDirect", testDecodeScienceDirect),
        ("testScienceDirect", testScienceDirect),
    ]
    #else
    static var allTests = [
        ("testDecodeAuth", testDecodeAuth),
        ("testDecodeScienceDirect", testDecodeScienceDirect),
        ("testScienceDirect", testScienceDirect),
    ]
    #endif
}
