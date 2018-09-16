import XCTest
@testable import ElsevierKit

final class ElsevierKitTests: XCTestCase {
    var elsevier: ElsevierKit!

    override func setUp() {
        super.setUp()

        self.elsevier = ElsevierKit.shared
    }

    func decode<T: Decodable>(_ url: String, model: T.Type) {
        let expect = self.expectation(description: url)

        let success: ElsevierKit.SuccessHandler<T> = { model in
            expect.fulfill()
            XCTAssertNotNil(model)
        }
        let failure: ElsevierKit.FailureHandler = { error in
            expect.fulfill()
            XCTFail(error.localizedDescription)
        }

        self.elsevier.request(url, success: success, failure: failure)
        self.wait(for: [expect], timeout: 10)
    }

    static var allTests = [
        ("testDecodeAuth", testDecodeAuth),
    ]
}
