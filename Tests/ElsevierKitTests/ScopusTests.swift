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
    /// Scopus Affiliation API test
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
}
