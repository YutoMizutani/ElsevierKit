//
//  ScienceDirectTests.swift
//  ElsevierKit
//
//  Created by Yuto Mizutani on 2018/09/17.
//

import XCTest
@testable import ElsevierKit

extension ElsevierKitTests {
    /// scidirV2PUTSearchResp.json to ScienceDirectSearchModel
    func testDecodeScienceDirect() {
        let jsonURL: String = "https://dev.elsevier.com/payloads/search/scidirV2PUTSearchResp.json"
        self.decode(jsonURL, model: ScienceDirectSearchModel.self)
    }

    /// ScienceDirect Search API test
    func testScienceDirect() {
        let expect: XCTestExpectation = self.expectation(description: #function)
        self.elsevier.scienceDirect.search(authors: "Yuto Mizutani", show: 10, success: { model in
            expect.fulfill()
            XCTAssertNotNil(model)
        }) { error in
            expect.fulfill()
            XCTFail(error.localizedDescription)
        }
        self.wait(for: [expect], timeout: self.timeout)
    }

    // MARK: - Abstract Retrieval API

    #if RELEASE
    /// DOI test
    func testScopusAbstractRetrievalDOI() {
        let expect: XCTestExpectation = self.expectation(description: #function)
        self.elsevier.scienceDirect.article(doi: "10.1016/S0014-5793(01)03313-0", success: { model in
            expect.fulfill()
            XCTAssertNotNil(model)
        }) { error in
            expect.fulfill()
            XCTFail(error.localizedDescription)
        }
        self.wait(for: [expect], timeout: self.timeout)
    }

    /// EID test
    func testScopusAbstractRetrievalEID() {
        let expect: XCTestExpectation = self.expectation(description: #function)
        self.elsevier.scienceDirect.article(eid: "2-s2.0-0037070197", success: { model in
            expect.fulfill()
            XCTAssertNotNil(model)
        }) { error in
            expect.fulfill()
            XCTFail(error.localizedDescription)
        }
        self.wait(for: [expect], timeout: self.timeout)
    }

    /// PII test
    func testScopusAbstractRetrieval() {
        let expect: XCTestExpectation = self.expectation(description: #function)
        self.elsevier.scienceDirect.article(pii: "S0014579301033130", success: { model in
            expect.fulfill()
            XCTAssertNotNil(model)
        }) { error in
            expect.fulfill()
            XCTFail(error.localizedDescription)
        }
        self.wait(for: [expect], timeout: self.timeout)
    }

    /// MEDLINE ID test
    func testScopusAbstractRetrievalMEDID() {
        let expect: XCTestExpectation = self.expectation(description: #function)
        self.elsevier.scienceDirect.article(pubmedID: "11852050", success: { model in
            expect.fulfill()
            XCTAssertNotNil(model)
        }) { error in
            expect.fulfill()
            XCTFail(error.localizedDescription)
        }
        self.wait(for: [expect], timeout: self.timeout)
    }

    /// Scopus ID test
    func testScopusAbstractRetrievalScopusID() {
        let expect: XCTestExpectation = self.expectation(description: #function)
        self.elsevier.scienceDirect.article(scopusID: "0037070197", success: { model in
            expect.fulfill()
            XCTAssertNotNil(model)
        }) { error in
            expect.fulfill()
            XCTFail(error.localizedDescription)
        }
        self.wait(for: [expect], timeout: self.timeout)
    }
    #endif
}
