//
//  ScienceDirectArticleEntitlementRetrievalModel.swift
//  ElsevierKit iOS
//
//  Created by Yuto Mizutani on 2018/10/02.
//

import Foundation

public struct ScienceDirectArticleEntitlementRetrievalModel: Codable {
    public let entitlementResponse: EntitlementResponse

    public struct EntitlementResponse: Codable {
        public let documentEntitlement: DocumentEntitlement

        public struct DocumentEntitlement: Codable {
            public let status: String
            public let dcIdentifier: String
            public let prismUrl: String
            public let prismDoi: String
            public let pii: String
            public let piiNorm: String
            public let scopusId: String
            public let pubmedId: String
            public let eid: String
            public let entitled: String
            public let message: String
            public let link: Link

            public struct Link: Codable {
                public let rel: String
                public let href: String

                private enum CodingKeys: String, CodingKey {
                    case rel = "@rel"
                    case href = "@href"
                }
            }

            private enum CodingKeys: String, CodingKey {
                case status = "@status"
                case dcIdentifier = "dc:identifier"
                case prismUrl = "prism:url"
                case prismDoi = "prism:doi"
                case pii
                case piiNorm = "pii-norm"
                case scopusId = "scopus_id"
                case pubmedId = "pubmed_id"
                case eid
                case entitled
                case message
                case link
            }
        }

        private enum CodingKeys: String, CodingKey {
            case documentEntitlement = "document-entitlement"
        }
    }

    private enum CodingKeys: String, CodingKey {
        case entitlementResponse = "entitlement-response"
    }
}
