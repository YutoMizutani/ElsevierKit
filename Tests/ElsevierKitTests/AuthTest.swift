//
//  AuthTest.swift
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

    func testAuth() {
        let expect = self.expectation(description: #function)
        self.elsevier.auth.authenticate(apiKey: Secrets.apiKey, success: { model in
            expect.fulfill()
            XCTAssertNotNil(model)
        }) { error in
            expect.fulfill()
            XCTFail(error.localizedDescription)
        }
        self.wait(for: [expect], timeout: 10)
    }
}
