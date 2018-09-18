//
//  ScopusSearchModel.swift
//  ElsevierKit
//
//  Created by Yuto Mizutani on 2018/09/18.
//

import Foundation

/**
 Scopus Search Model
 */
public struct ScopusSearchModel: Codable {
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
            public let title: String
            public let creator: String
            public let publicationName: String
            public let issn: String?
            public let eIssn: String?
            public let sourceID: String?
            public let isOpenAccess: Bool?
            public let openaccess: String?
            public let volume: String
            public let issueIdentifier: String?
            public let pageRange: String?
            public let coverDate: String
            public let coverDisplayDate: String
            public let doi: String?
            public let description: String?
            public let citedByCount: String
            public let affiliation: [Affiliation]
            public let aggregationType: String
            public let subtype: String
            public let subtypeDescription: String
            public let author: [Author]?
            public let authkeywords: String?
            public let eid: String?
            public let pii: String?

            public struct Affiliation: Codable {
                public let fa: String
                public let url: String?
                public let afid: String?
                public let affilname: String
                public let city: String
                public let country: String
                public let variant: [Variant]?

                private enum CodingKeys: String, CodingKey {
                    case fa = "@_fa"
                    case url = "affiliation-url"
                    case afid
                    case affilname
                    case city = "affiliation-city"
                    case country = "affiliation-country"
                    case variant = "name-variant"
                }
            }

            public struct Author: Codable {
                public let fa: String
                public let url: String
                public let authid: String
                public let authname: String
                public let givenName: String
                public let surname: String
                public let initials: String
                public let afid: [Variant]

                private enum CodingKeys: String, CodingKey {
                    case fa = "@_fa"
                    case url = "author-url"
                    case authid
                    case authname
                    case givenName = "given-name"
                    case surname
                    case initials
                    case afid
                }
            }

            private enum CodingKeys: String, CodingKey {
                case fa = "@_fa"
                case link
                case url = "prism:url"
                case identifier = "dc:identifier"
                case title = "dc:title"
                case creator = "dc:creator"
                case publicationName = "prism:publicationName"
                case issn = "prism:issn"
                case eIssn = "prism:eIssn"
                case sourceID = "source-id"
                case isOpenAccess = "openaccessFlag"
                case openaccess
                case volume = "prism:volume"
                case issueIdentifier = "prism:issueIdentifier"
                case pageRange = "prism:pageRange"
                case coverDate = "prism:coverDate"
                case coverDisplayDate = "prism:coverDisplayDate"
                case doi = "prism:doi"
                case description = "dc:description"
                case citedByCount = "citedby-count"
                case affiliation
                case aggregationType = "prism:aggregationType"
                case subtype
                case subtypeDescription
                case author
                case authkeywords
                case eid
                case pii
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
