//
//  ScopusAbstractRetrievalModel.swift
//  ElsevierKit iOS
//
//  Created by Yuto Mizutani on 2018/10/02.
//

import Foundation

/**
 Scopus Abstract Retrieval Model
 */
public struct ScopusAbstractRetrievalModel: Codable {
    public let abstractsRetrievalResponse: AbstractsRetrievalResponse

    public struct AbstractsRetrievalResponse: Codable {
        public let affiliation: [Affiliation]
        public let coredata: Coredata

        public struct Affiliation: Codable {
            public let affiliationCity: String
            public let affilname: String
            public let affiliationCountry: String

            private enum CodingKeys: String, CodingKey {
                case affiliationCity = "affiliation-city"
                case affilname
                case affiliationCountry = "affiliation-country"
            }
        }

        public struct Coredata: Codable {
            public let srctype: String
            public let eid: String
            public let pubmedId: String
            public let prismCoverDate: String
            public let prismAggregationType: String
            public let prismUrl: String
            public let dcCreator: DcCreator
            public let link: [Link]
            public let sourceId: String
            public let pii: String
            public let citedbyCount: String
            public let prismVolume: String
            public let subtype: String
            public let dcTitle: String
            public let prismIssn: String
            public let prismIssueIdentifier: String
            public let subtypeDescription: String
            public let prismPublicationName: String
            public let prismPageRange: String
            public let prismEndingPage: String
            public let prismDoi: String
            public let prismStartingPage: String
            public let dcIdentifier: String

            public struct DcCreator: Codable {
                public let author: [Author]

                public struct Author: Codable {
                    public let preferredName: PreferredName
                    public let seq: String
                    public let ceInitials: String
                    public let fa: String
                    public let affiliation: Affiliation
                    public let ceSurname: String
                    public let auid: String
                    public let authorUrl: String
                    public let ceIndexedName: String

                    public struct PreferredName: Codable {
                        public let ceGivenName: String
                        public let ceInitials: String
                        public let ceSurname: String
                        public let ceIndexedName: String

                        private enum CodingKeys: String, CodingKey {
                            case ceGivenName = "ce:given-name"
                            case ceInitials = "ce:initials"
                            case ceSurname = "ce:surname"
                            case ceIndexedName = "ce:indexed-name"
                        }
                    }

                    public struct Affiliation: Codable {
                        public let id: String
                        public let href: String

                        private enum CodingKeys: String, CodingKey {
                            case id = "@id"
                            case href = "@href"
                        }
                    }

                    private enum CodingKeys: String, CodingKey {
                        case preferredName = "preferred-name"
                        case seq = "@seq"
                        case ceInitials = "ce:initials"
                        case fa = "@_fa"
                        case affiliation
                        case ceSurname = "ce:surname"
                        case auid = "@auid"
                        case authorUrl = "author-url"
                        case ceIndexedName = "ce:indexed-name"
                    }
                }
            }

            public struct Link: Codable {
                public let fa: String
                public let rel: String
                public let href: String

                private enum CodingKeys: String, CodingKey {
                    case fa = "@_fa"
                    case rel = "@rel"
                    case href = "@href"
                }
            }

            private enum CodingKeys: String, CodingKey {
                case srctype
                case eid
                case pubmedId = "pubmed-id"
                case prismCoverDate = "prism:coverDate"
                case prismAggregationType = "prism:aggregationType"
                case prismUrl = "prism:url"
                case dcCreator = "dc:creator"
                case link
                case sourceId = "source-id"
                case pii
                case citedbyCount = "citedby-count"
                case prismVolume = "prism:volume"
                case subtype
                case dcTitle = "dc:title"
                case prismIssn = "prism:issn"
                case prismIssueIdentifier = "prism:issueIdentifier"
                case subtypeDescription
                case prismPublicationName = "prism:publicationName"
                case prismPageRange = "prism:pageRange"
                case prismEndingPage = "prism:endingPage"
                case prismDoi = "prism:doi"
                case prismStartingPage = "prism:startingPage"
                case dcIdentifier = "dc:identifier"
            }
        }
    }

    private enum CodingKeys: String, CodingKey {
        case abstractsRetrievalResponse = "abstracts-retrieval-response"
    }
}
