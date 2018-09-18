//
//  ScienceDirect.swift
//  ElsevierKit
//
//  Created by Yuto Mizutani on 2018/09/16.
//

import Alamofire

public extension ElsevierKitScienceDirect {

    /**

     ScienceDirect Search API: This represents a search against the ScienceDirect cluster, which contains serial/nonserial full-text articles. ScienceDirect is a leading full-text scientific database offering journal articles and book chapters from more than 2,500 journals and almost 20,000 books. This API resource allows for the submission of Boolean queries into the ScienceDirect index, retrieving relevant result metadata in user-specific text formats.

     - Parameters:
         - authors: The article / book author(s) search field; Max 250 characters; This field searches both first AND last names.
         - date: Year (or year range) in which an article or chapter was published; Must match the following regex pattern: ^[0-9]{4}\s*(-\s*[0-9]{4})?$
         - isHighlights: Determines whether highlights for search terms should be returned. Default: false.
         - offset: The position from where search results begin. Default: 0; Permitted values: 0-6000
         - show: The number of results to retrieve per request. Default: 25; Permitted values: 10, 25, 50, 100
         - sortBy: How results should be sorted. Default: relevance.
         - isOpenAccess: Flag that can be used to filter results to only include open access content.
         - issue: The issue numeric search field. This field supports both issue numbers and issue ranges; Must match the following regex pattern: ^[0-9]{1,15}\s*(-\s*[0-9]{1,15})?$
         - loadedAfter: Field that can be used to search only for articles loaded onto the ScienceDirect website after a certain date; Must be a combined date in ISO 8601 format: yyyy-MM-dd'T'HH:mm:ssX
         - page: The page search field. This field supports both page numbers and page ranges; Must match the following regex pattern: ^([0-9A-Za-z\.]{1,15})\s*(-\s*([0-9A-Za-z\.]{1,15}))?$
         - pub: Searches the title of a journal or book; Max 250 characters
         - qs: The general search field for searching over all article / book chapter content (excluding references); Max 250 characters
         - title: Searches the title of an article or book chapter; Max 250 characters
         - volume: The volume search field. This field supports both volume numbers and volume ranges; Must match the following regex pattern: ^[0-9]{1,15}\s*(-\s*[0-9]{1,15})?$
         - success: Success handler
         - failure: Failure handler

     - SeeAlso:
     https://dev.elsevier.com/tecdoc_sdsearch_migration.html
     https://dev.elsevier.com/documentation/ScienceDirectSearchAPI.wadl
     */
    func search(authors: String? = nil,
                date: String? = nil,
                isHighlights highlights: Bool? = nil,
                offset: Int? = nil,
                show: Int? = nil,
                sortBy: SDSortType? = nil,
                isOpenAccess openAccess: Bool? = nil,
                issue: String? = nil,
                loadedAfter: String? = nil,
                page: String? = nil,
                pub: String? = nil,
                qs: String? = nil,
                title: String? = nil,
                volume: String? = nil,
                success: ElsevierKit.SuccessHandler<ScienceDirectSearchModel>? = nil,
                failure: ElsevierKit.FailureHandler? = nil) {

        guard authors != nil ||
            date != nil ||
            highlights != nil ||
            offset != nil ||
            show != nil ||
            sortBy != nil ||
            openAccess != nil ||
            issue != nil ||
            loadedAfter != nil ||
            page != nil ||
            pub != nil ||
            qs != nil ||
            title != nil ||
            volume != nil else {
                failure?(ElsevierKitError.emptyParameters)
                return
        }

        var parameters: Parameters = Parameters()
        parameters["authors"] ?= authors
        parameters["date"] ?= date
        let display: Parameters? = { () -> Parameters? in
            var parameters = Parameters()
            parameters["highlights"] ?= highlights
            parameters["offset"] ?= offset
            parameters["show"] ?= show
            parameters["sortBy"] ?= sortBy?.rawValue
            return !parameters.isEmpty ? parameters : nil
        }()
        parameters["display"] ?= display
        let filters: Parameters? = { () -> Parameters? in
            var parameters = Parameters()
            parameters["openAccess"] ?= openAccess
            return !parameters.isEmpty ? parameters : nil
        }()
        parameters["filters"] ?= filters
        parameters["issue"] ?= issue
        parameters["loadedAfter"] ?= loadedAfter
        parameters["page"] ?= page
        parameters["pub"] ?= pub
        parameters["qs"] ?= qs
        parameters["title"] ?= title
        parameters["volume"] ?= volume

        ElsevierKit.shared.request(API.ScienceDirect.search,
                                   method: .put,
                                   parameters: parameters,
                                   encoding: JSONEncoding.default,
                                   success: { model in
                                        success?(model)
                                   },
                                   failure: { error in
                                       failure?(error)
                                   })
    }
}
