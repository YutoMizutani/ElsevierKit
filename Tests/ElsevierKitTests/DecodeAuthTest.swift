//
//  DecodeAuthTest.swift
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
}
