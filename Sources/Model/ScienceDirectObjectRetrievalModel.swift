//
//  ScienceDirectObjectRetrievalModel.swift
//  ElsevierKit
//
//  Created by Yuto Mizutani on 2018/10/02.
//

import Foundation

public struct ScienceDirectObjectRetrievalModel: Codable {
    public let choices: Choices

    public struct Choices: Codable {
        public let choice: [Choice]

        public struct Choice: Codable {
            public let ref: String
            public let type: String
            public let value: String

            private enum CodingKeys: String, CodingKey {
                case ref = "@ref"
                case type = "@type"
                case value = "$"
            }
        }
    }
}
