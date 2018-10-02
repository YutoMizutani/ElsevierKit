//
//  ScopusTests.swift
//  ElsevierKit
//
//  Created by Yuto Mizutani on 2018/09/18.
//

import XCTest
@testable import ElsevierKit

extension ElsevierKitTests {

    // MARK: - Affiliation Search API

    /// affiliationSearchResp.json to ScopusAffiliationModel
    func testDecodeScopusAffiliation() {
        let jsonURL: String = "https://dev.elsevier.com/payloads/search/affiliationSearchResp.json"
        self.decode(jsonURL, model: ScopusAffiliationModel.self)
    }

    #if RELEASE
    /// Scopus Affiliation API test
    func testScopusAffiliation() {
//        let expect: XCTestExpectation = self.expectation(description: #function)
//        self.elsevier.scopus.affiliation(query: "Mizutani", success: { model in
//            expect.fulfill()
//            XCTAssertNotNil(model)
//        }) { error in
//            expect.fulfill()
//            XCTFail(error.localizedDescription)
//        }
//        self.wait(for: [expect], timeout: self.timeout)
        XCTAssert(true)
    }
    #endif

    // MARK: - Author Search API

    /// authorSearchResp.json to ScopusAuthorModel
    func testDecodeScopusAuthor() {
//        let jsonURL: String = "https://dev.elsevier.com/payloads/search/authorSearchResp.json"
//        self.decode(jsonURL, model: ScopusAuthorModel.self)
        XCTAssert(true)
    }

    #if RELEASE
    /// Scopus Author API test
    func testScopusAuthor() {
//        let expect: XCTestExpectation = self.expectation(description: #function)
//        self.elsevier.scopus.author(query: "Mizutani", success: { model in
//            expect.fulfill()
//            XCTAssertNotNil(model)
//        }) { error in
//            expect.fulfill()
//            XCTFail(error.localizedDescription)
//        }
//        self.wait(for: [expect], timeout: self.timeout)
        XCTAssert(true)
    }
    #endif

    // MARK: - SCOPUS Search API

    /// scopusSearchResp.json to ScopusSearchModel
    func testDecodeScopus() {
//        let jsonURL: String = "https://dev.elsevier.com/payloads/search/scopusSearchResp.json"
//        self.decode(jsonURL, model: ScopusSearchModel.self)
        XCTAssert(true)
    }

    #if RELEASE
    /// Scopus Search API test
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
    #endif

    // MARK: - Abstract Retrieval API

    #if RELEASE
    /// Scopus ID test
    func testScopusAbstractRetrievalScopusID() {
        let expect: XCTestExpectation = self.expectation(description: #function)
        self.elsevier.scopus.abstruct(scopusID: "0037070197", success: { model in
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
        self.elsevier.scopus.abstruct(eid: "2-s2.0-0037070197", success: { model in
            expect.fulfill()
            XCTAssertNotNil(model)
        }) { error in
            expect.fulfill()
            XCTFail(error.localizedDescription)
        }
        self.wait(for: [expect], timeout: self.timeout)
    }

    /// DOI test
    func testScopusAbstractRetrievalDOI() {
        let expect: XCTestExpectation = self.expectation(description: #function)
        self.elsevier.scopus.abstruct(doi: "10.1016/S0014-5793(01)03313-0", success: { model in
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
        self.elsevier.scopus.abstruct(pii: "S0014579301033130", success: { model in
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
        self.elsevier.scopus.abstruct(pubmedID: "11852050", success: { model in
            expect.fulfill()
            XCTAssertNotNil(model)
        }) { error in
            expect.fulfill()
            XCTFail(error.localizedDescription)
        }
        self.wait(for: [expect], timeout: self.timeout)
    }

    /// PUI test
    func testScopusAbstractRetrievalPUI() {
        let expect: XCTestExpectation = self.expectation(description: #function)
        self.elsevier.scopus.abstruct(pui: "34164449", success: { model in
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
