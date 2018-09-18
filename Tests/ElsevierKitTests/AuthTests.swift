//
//  AuthTests.swift
//  ElsevierKit
//
//  Created by Yuto Mizutani on 2018/09/16.
//

import XCTest
@testable import ElsevierKit

extension ElsevierKitTests {
    /// authResp.json to AuthenticateModel
    func testDecodeAuth() {
        let jsonURL: String = "https://dev.elsevier.com/payloads/authentication/authResp.json"
        self.decode(jsonURL, model: AuthenticateModel.self)
    }

    #if RELEASE
    /// Authentication API test
    func testAuth() {
        let expect: XCTestExpectation = self.expectation(description: #function)
        self.elsevier.auth.authenticate(apiKey: Secrets.apiKey, platform: .scopus, success: { [weak self] in
            expect.fulfill()
            XCTAssertNotNil(self)
            guard let `self` = self else { return }
            XCTAssertNotNil(self.elsevier.header?.authToken)
        }) { error in
            expect.fulfill()
            XCTFail(error.localizedDescription)
        }
        self.wait(for: [expect], timeout: self.timeout)
    }
    #endif
}
