//
//  ScienceDirectArticleRetrievalModel.swift
//  ElsevierKit iOS
//
//  Created by Yuto Mizutani on 2018/10/02.
//

import Foundation

public struct ScienceDirectArticleRetrievalModel: Codable {
    public let fullTextRetrievalResponse: FullTextRetrievalResponse

    public struct FullTextRetrievalResponse: Codable {
        public let scopusEid: String
        public let originalText: String
        public let scopusId: String
        public let pubmedId: String
        public let coredata: Coredata
        public let objects: Objects
        public let link: Link

        public struct Coredata: Codable {
            public let eid: String
            public let dcDescription: String
            public let openArchiveArticle: String
            public let prismCoverDate: String
            public let openaccessUserLicense: String
            public let prismAggregationType: String
            public let prismUrl: String
            public let dcCreator: [DcCreator]
            public let link: [Link]
            public let dcFormat: String
            public let openaccessType: String
            public let pii: String
            public let prismVolume: String
            public let prismPublisher: String
            public let dcTitle: String
            public let prismCopyright: String
            public let openaccess: String
            public let prismIssn: String
            public let dctermsSubject: [DctermsSubject]
            public let openaccessArticle: String
            public let prismPublicationName: String
            public let openaccessSponsorType: String
            public let prismPageRange: String
            public let prismEndingPage: String
            public let prismCoverDisplayDate: String
            public let prismDoi: String
            public let prismStartingPage: String
            public let dcIdentifier: String
            public let openaccessSponsorName: String

            public struct DcCreator: Codable {
                public let fa: String
                public let value: String

                private enum CodingKeys: String, CodingKey {
                    case fa = "@_fa"
                    case value = "$"
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

            public struct DctermsSubject: Codable {
                public let fa: String
                public let value: String

                private enum CodingKeys: String, CodingKey {
                    case fa = "@_fa"
                    case value = "$"
                }
            }

            private enum CodingKeys: String, CodingKey {
                case eid
                case dcDescription = "dc:description"
                case openArchiveArticle
                case prismCoverDate = "prism:coverDate"
                case openaccessUserLicense
                case prismAggregationType = "prism:aggregationType"
                case prismUrl = "prism:url"
                case dcCreator = "dc:creator"
                case link
                case dcFormat = "dc:format"
                case openaccessType
                case pii
                case prismVolume = "prism:volume"
                case prismPublisher = "prism:publisher"
                case dcTitle = "dc:title"
                case prismCopyright = "prism:copyright"
                case openaccess
                case prismIssn = "prism:issn"
                case dctermsSubject = "dcterms:subject"
                case openaccessArticle
                case prismPublicationName = "prism:publicationName"
                case openaccessSponsorType
                case prismPageRange = "prism:pageRange"
                case prismEndingPage = "prism:endingPage"
                case prismCoverDisplayDate = "prism:coverDisplayDate"
                case prismDoi = "prism:doi"
                case prismStartingPage = "prism:startingPage"
                case dcIdentifier = "dc:identifier"
                case openaccessSponsorName
            }
        }

        public struct Objects: Codable {
            public let object: [Object]

            public struct Object: Codable {
                public let category: String
                public let height: String?
                public let width: String?
                public let fa: String
                public let value: String
                public let multimediatype: String
                public let `type`: String
                public let size: String
                public let ref: String
                public let mimetype: String

                private enum CodingKeys: String, CodingKey {
                    case category = "@category"
                    case height = "@height"
                    case width = "@width"
                    case fa = "@_fa"
                    case value = "$"
                    case multimediatype = "@multimediatype"
                    case `type` = "@type"
                    case size = "@size"
                    case ref = "@ref"
                    case mimetype = "@mimetype"
                }
            }
        }

        public struct Link: Codable {
            public let rel: String
            public let href: String

            private enum CodingKeys: String, CodingKey {
                case rel = "@rel"
                case href = "@href"
            }
        }

        private enum CodingKeys: String, CodingKey {
            case scopusEid = "scopus-eid"
            case originalText
            case scopusId = "scopus-id"
            case pubmedId = "pubmed-id"
            case coredata
            case objects
            case link
        }
    }

    private enum CodingKeys: String, CodingKey {
        case fullTextRetrievalResponse = "full-text-retrieval-response"
    }
}
