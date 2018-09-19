//
//  ScopusAffiliationModel.swift
//  ElsevierKit
//
//  Created by Yuto Mizutani on 2018/09/19.
//

import Foundation

/**
 Scopus Affiliation Model
 */
public struct ScopusAffiliationModel: Codable {
    public let searchResults: SearchResults

    public struct SearchResults: Codable {
        public let totalResults: String
        public let startIndex: String
        public let itemsPerPage: String
        public let query: Query
        public let link: [Link]
        public let entry: [Entry]

        public struct Query: Codable {
            public let role: String
            public let searchTerms: String
            public let startPage: String

            private enum CodingKeys: String, CodingKey {
                case role = "@role"
                case searchTerms = "@searchTerms"
                case startPage = "@startPage"
            }
        }

        public struct Link: Codable {
            public let fa: String
            public let ref: String
            public let href: String
            public let type: String?

            private enum CodingKeys: String, CodingKey {
                case fa = "@_fa"
                case ref = "@ref"
                case href = "@href"
                case type = "@type"
            }
        }

        public struct Entry: Codable {
            public let fa: String
            public let link: [Link]
            public let url: String
            public let identifier: String
            public let affiliationName: String
            public let variant: [Variant]
            public let documentCount: String
            public let city: String
            public let country: String

            private enum CodingKeys: String, CodingKey {
                case fa = "@_fa"
                case link
                case url = "prism:url"
                case identifier = "dc:identifier"
                case affiliationName = "affiliation-name"
                case variant = "name-variant"
                case documentCount = "document-count"
                case city
                case country
            }
        }

        public struct Variant: Codable {
            public let fa: String
            public let value: String

            private enum CodingKeys: String, CodingKey {
                case fa = "@_fa"
                case value = "$"
            }
        }

        private enum CodingKeys: String, CodingKey {
            case totalResults = "opensearch:totalResults"
            case startIndex = "opensearch:startIndex"
            case itemsPerPage = "opensearch:itemsPerPage"
            case query = "opensearch:Query"
            case link
            case entry
        }
    }

    private enum CodingKeys: String, CodingKey {
        case searchResults = "search-results"
    }
}
