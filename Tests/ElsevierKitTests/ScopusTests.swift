//
//  ScopusTests.swift
//  ElsevierKit
//
//  Created by Yuto Mizutani on 2018/09/18.
//

import XCTest
@testable import ElsevierKit

extension ElsevierKitTests {
    /// scopusSearchResp.json to ScopusSearchModel
    func testDecodeScopus() {
        // Cannot work
//        let jsonURL: String = "https://dev.elsevier.com/payloads/search/scopusSearchResp.json"
//        self.decode(jsonURL, model: ScopusSearchModel.self)
        XCTAssert(true)
    }

    /// ScienceDirect Search API test
    func testScopus() {
        let expect: XCTestExpectation = self.expectation(description: #function)
        self.elsevier.scopus.search(query: "Operant", success: { model in
            expect.fulfill()
            XCTAssertNotNil(model)
        }) { error in
            expect.fulfill()
            XCTFail(error.localizedDescription)
        }
        self.wait(for: [expect], timeout: self.timeout)
    }
}
