//
//  ScienceDirectTests.swift
//  ElsevierKit
//
//  Created by Yuto Mizutani on 2018/09/17.
//

import XCTest
@testable import ElsevierKit

extension ElsevierKitTests {
    /// scidirV2PUTSearchResp.json to AuthenticateModel
    func testDecodeScienceDirect() {
        let jsonURL: String = "https://dev.elsevier.com/payloads/search/scidirV2PUTSearchResp.json"
        self.decode(jsonURL, model: ScienceDirectSearchModel.self)
    }

    /// ScienceDirect Search API test
    func testScienceDirect() {
        let expect = self.expectation(description: #function)
        self.elsevier.scienceDirect.search(authors: "Yuto Mizutani", show: 10, success: { model in
            expect.fulfill()
            XCTAssertNotNil(model)
        }) { error in
            expect.fulfill()
            XCTFail(error.localizedDescription)
        }
        self.wait(for: [expect], timeout: 10)
    }
}
