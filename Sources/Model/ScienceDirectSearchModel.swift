//
//  ScienceDirectSearchModel.swift
//  ElsevierKit
//
//  Created by Yuto Mizutani on 2018/09/16.
//

import Foundation

/**
 ScienceDirect Search Model
 */
public struct ScienceDirectSearchModel: Codable {
    public let resultsFound: Int?

    public let results: [Result]?

    public struct Result: Codable {

        public let authors: [Author]

        public let doi: String

        public let loadDate: String

        public let isOpenAccess: Bool

        public let pages: Pages

        public let pii: String

        public let publicationDate: String

        public let sourceTitle: String

        public let title: String

        public let uri: String

        public let volumeIssue: String?

        private enum CodingKeys: String, CodingKey {
            case authors
            case doi
            case loadDate
            case isOpenAccess = "openAccess"
            case pages
            case pii
            case publicationDate
            case sourceTitle
            case title
            case uri
            case volumeIssue
        }

        public struct Author: Codable {
            public let order: Int
            public let name: String
        }

        public struct Pages: Codable {
            public let first: String?
            public let last: String?
        }
    }
}
