//
//  API.swift
//  ElsevierKit
//
//  Created by Yuto Mizutani on 2018/09/16.
//

import Foundation

/// Elsevier API
public struct API {

    // MARK: - General Purpose APIs

    /// Authentication API
    public static let authentication: String = "https://api.elsevier.com/authenticate"

    // MARK: - Product Specific APIs

    /// ScienceDirect APIs
    public enum ScienceDirect {
        /// ScienceDirect Search API V2
        public static let search: String = "https://api.elsevier.com/content/search/sciencedirect"
        /// ScienceDirect Article (Full Text) Retrieval API
        public static let article: String = "https://api.elsevier.com/content/article"
    }

    /// ScienceDirect APIs
    public enum Scopus {
        /// Affiliation Search API
        public static let affiliation: String = "https://api.elsevier.com/content/search/affiliation"
        /// Author Search API
        public static let author: String = "https://api.elsevier.com/content/search/author"
        /// Scopus Search API
        public static let search: String = "https://api.elsevier.com/content/search/scopus"
        /// Abstract Retrieval API
        public static let abstruct: String = "https://api.elsevier.com/content/abstract"
    }

    /// Engineering Village APIs
    public enum EngineeringVillage {
        /// Engineering Village Search API
        public static let search: String = "https://api.elsevier.com/content/ev/results"
    }
}
