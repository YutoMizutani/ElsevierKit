//
//  AuthenticateModel.swift
//  ElsevierKit
//
//  Created by Yuto Mizutani on 2018/09/16.
//

import Foundation

/**
 Authenticate Model
 */
public struct AuthenticateModel: Codable {
    public let authenticateResponse: Response

    public struct Response: Codable {
        public let choice: String
        public let type: String
        public let authToken: String

        private enum CodingKeys: String, CodingKey {
            case choice = "@choice"
            case type = "@type"
            case authToken = "authtoken"
        }
    }

    private enum CodingKeys: String, CodingKey {
        case authenticateResponse = "authenticate-response"
    }
}
