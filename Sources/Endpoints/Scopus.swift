//
//  Scopus.swift
//  ElsevierKit
//
//  Created by Yuto Mizutani on 2018/09/18.
//

import Alamofire

public extension ElsevierKitScopus {

    // MARK: - Affiliation Search API

    /**

     Affiliation Search API: This represents a search against the Affiliation cluster, which contains SCOPUS Affiliation Profiles.

     - Parameters:
         - query: This represents the boolean search to be executed against the SCOPUS cluster. There is additional information regarding [Search Tips](https://dev.elsevier.com/tips/ScopusSearchTips.htm); ex. query=heart+attack%20AND%20text(liver)
         - viewType: This alias represents the list of elements that will be returned in the response. The following chart shows the [Scopus Search Views](https://dev.elsevier.com/guides/ScopusSearchViews.htm).
         - field: This alias represents the name of specific fields that should be returned. The list of fields include all of the fields returned in the response payload (see view). Multiple fields can be specified, delimited by commas. Note that specifying this parameter overrides the view parameter.
         - isSuppressNavLinks: This parameter is used to suppress the inclusion of top-level navigation links in the response payload.
         - start: Numeric value representing the results offset (i.e. starting position for the search results). The maximum for this value is a system-level default (varies with search cluster) minus the number of results requested. If not specified the offset will be set to zero (i.e. first search result); ex. start=5
         - count: Numeric value representing the maximum number of results to be returned for the search. If not provided this will be set to a system default based on service level. In addition the number cannot exceed the maximum system default - if it does an error will be returned; ex. count=10
         - sortTypes: Represents the sort field name and order. A plus in front of the sort field name indicates ascending order, a minus indicates descending order. If sort order is not specified (i.e. no + or -) then the order defaults to ascending (ASC). Up to three fields can be specified, each delimited by a comma. The precedence is determined by their order (i.e. first is primary, second is secondary, and third is tertiary).
         - facets: Represents the navigator that should be included in the search results. One or more navigators can be specified on the request, delimited by a semicolon Different dimensions of the navigator will be represented within parentheses; ex. facets=authname(count=20,sort=na,prefix=Ma);exactsrctitle (prefix=J);subjarea(sort=fd);pubyear;exactkeyword(sort=fdna)
         - success: Success handler
         - failure: Failure handler

     - SeeAlso:
     https://dev.elsevier.com/documentation/AffiliationSearchAPI.wadl
     */
    func affiliation(query: String,
                     viewType view: ScopusSearchViewType? = nil,
                     field: String? = nil,
                     isSuppressNavLinks suppressNavLinks: Bool? = nil,
                     start: Int? = nil,
                     count: Int? = nil,
                     sortTypes: [SCSortType] = [],
                     cursor: String? = nil,
                     facets: String? = nil,
                     success: ElsevierKit.SuccessHandler<ScopusAffiliationModel>? = nil,
                     failure: ElsevierKit.FailureHandler? = nil) {

        var parameters: Parameters = Parameters()
        parameters["query"] = query
        parameters["view"] ?= view?.rawValue
        parameters["field"] ?= field
        parameters["suppressNavLinks"] ?= suppressNavLinks?.description
        parameters["start"] ?= start?.description
        parameters["count"] ?= count?.description
        // Max 3 params
        let sort: String? = !sortTypes.isEmpty ? sortTypes.prefix(3).map { $0.rawValue }.joined(separator: ",") : nil
        parameters["sort"] ?= sort
        parameters["cursor"] ?= cursor
        parameters["facets"] ?= facets

        ElsevierKit.shared.request(API.Scopus.affiliation,
                                   method: .get,
                                   parameters: parameters,
                                   success: { model in
                                       success?(model)
                                   },
                                   failure: { error in
                                       failure?(error)
                                   })
    }

    // MARK: - Author Search API

    /**

     Author Search API: This represents a search against the Author cluster, which contains SCOPUS Author Profiles.

     - Parameters:
         - query: This represents the boolean search to be executed against the Author cluster. There is additional information regarding [Search Tips](https://dev.elsevier.com/tips/AuthorSearchTips.htm). ex. query=affil(university)
         - coAuthor: This is an alternative to the query parameter where an author identifier can be submitted and a list of all associated co-authors will be returned. If this parameter is present the query parameter is ignored. Note that only a single author identifier should be submitted.
         - viewType: This alias represents the list of elements that will be returned in the response. The following chart shows the [Author Search Views](https://dev.elsevier.com/guides/AuthorSearchViews.htm).
         - field: This alias represents the name of specific fields that should be returned. The list of fields include all of the fields returned in the response payload (see view). Multiple fields can be specified, delimited by commas. Note that specifying this parameter overrides the view parameter. ex. field=url,identifier,description
         - isSuppressNavLinks: This parameter is used to suppress the inclusion of top-level navigation links in the response payload.
         - start: Numeric value representing the results offset (i.e. starting position for the search results). The maximum for this value is a system-level default (varies with search cluster) minus the number of results requested. If not specified the offset will be set to zero (i.e. first search result); ex. start=5
         - count: Numeric value representing the maximum number of results to be returned for the search. If not provided this will be set to a system default based on service level. In addition the number cannot exceed the maximum system default - if it does an error will be returned; ex. count=10
         - sortTypes: Represents the sort field name and order. A plus in front of the sort field name indicates ascending order, a minus indicates descending order. If sort order is not specified (i.e. no + or -) then the order defaults to ascending (ASC). Up to three fields can be specified, each delimited by a comma. The precedence is determined by their order (i.e. first is primary, second is secondary, and third is tertiary).
         - facets: Represents the navigator that should be included in the search results. One or more navigators can be specified on the request, delimited by a semicolon Different dimensions of the navigator will be represented within parentheses; ex. facets=authname(count=20,sort=na,prefix=Ma);exactsrctitle (prefix=J);subjarea(sort=fd);pubyear;exactkeyword(sort=fdna)
         - isAlias: The default behavior is to substitute any author identifiers submitted in the search with their aliased (superseded) counterparts. Thus, a logical search for author id 1234 may be automatically substituted with a logical search for author ids 5678 and 9012 because those are the "superseding" identifiers the original has been mapped to. If 'alias=false' is submitted this behavior will be overridden and the original identifier(s) will NOT be substituted.
         - success: Success handler
         - failure: Failure handler

     - SeeAlso:
     https://dev.elsevier.com/documentation/AuthorSearchAPI.wadl
     */
    func author(query: String? = nil,
                coAuthor: Int? = nil,
                viewType view: ScopusSearchViewType? = nil,
                field: String? = nil,
                isSuppressNavLinks suppressNavLinks: Bool? = nil,
                start: Int? = nil,
                count: Int? = nil,
                sortTypes: [SCSortType] = [],
                cursor: String? = nil,
                facets: String? = nil,
                isAlias alias: Bool? = nil,
                success: ElsevierKit.SuccessHandler<ScopusAuthorModel>? = nil,
                failure: ElsevierKit.FailureHandler? = nil) {

        guard query != nil || coAuthor != nil else {
            failure?(ElsevierKitError.emptyParameters)
            return
        }

        var parameters: Parameters = Parameters()
        parameters["query"] = query
        parameters["co-author"] = coAuthor
        parameters["view"] ?= view?.rawValue
        parameters["field"] ?= field
        parameters["suppressNavLinks"] ?= suppressNavLinks?.description
        parameters["start"] ?= start?.description
        parameters["count"] ?= count?.description
        // Max 3 params
        let sort: String? = !sortTypes.isEmpty ? sortTypes.prefix(3).map { $0.rawValue }.joined(separator: ",") : nil
        parameters["sort"] ?= sort
        parameters["cursor"] ?= cursor
        parameters["facets"] ?= facets
        parameters["alias"] ?= alias?.description

        ElsevierKit.shared.request(API.Scopus.author,
                                   method: .get,
                                   parameters: parameters,
                                   success: { model in
                                       success?(model)
                                   },
                                   failure: { error in
                                       failure?(error)
                                   })
    }

    // MARK: - SCOPUS Search API

    /**

     SCOPUS Search API: This represents a search against the SCOPUS cluster, which contains SCOPUS abstracts. Scopus is the largest abstract and citation database of research literature and quality web sources. Updated daily, Scopus covers 50 million abstracts of over 20,500 peer-reviewed titles from more than 5,000 publishers. This search resource allows for the submission of Boolean queries into the Scopus index, retrieving relevant result metadata in a user-specific text formats.

     - Parameters:
         - query: This represents the boolean search to be executed against the SCOPUS cluster. There is additional information regarding [Search Tips](https://dev.elsevier.com/tips/ScopusSearchTips.htm); ex. query=heart+attack%20AND%20text(liver)
        - viewType: This alias represents the list of elements that will be returned in the response. The following chart shows the [Scopus Search Views](https://dev.elsevier.com/guides/ScopusSearchViews.htm).
        - field: This alias represents the name of specific fields that should be returned. The list of fields include all of the fields returned in the response payload (see view). Multiple fields can be specified, delimited by commas. Note that specifying this parameter overrides the view parameter.
        - isSuppressNavLinks: This parameter is used to suppress the inclusion of top-level navigation links in the response payload.
        - date: Represents the date range associated with the search, with the lowest granularity being year. ex. date=2002-2007
        - start: Numeric value representing the results offset (i.e. starting position for the search results). The maximum for this value is a system-level default (varies with search cluster) minus the number of results requested. If not specified the offset will be set to zero (i.e. first search result); ex. start=5
        - count: Numeric value representing the maximum number of results to be returned for the search. If not provided this will be set to a system default based on service level. In addition the number cannot exceed the maximum system default - if it does an error will be returned; ex. count=10
        - sortTypes: Represents the sort field name and order. A plus in front of the sort field name indicates ascending order, a minus indicates descending order. If sort order is not specified (i.e. no + or -) then the order defaults to ascending (ASC). Up to three fields can be specified, each delimited by a comma. The precedence is determined by their order (i.e. first is primary, second is secondary, and third is tertiary).
        - contentType: This parameter is used to filter specific categories of content that should be searched/returned.
        - subjctType: Represents the subject area code associated with the content category desired. Note that these subject code mapping vary based upon the environment in which the request is executed. The following resource shows all of the available [subject classifications](https://api.elsevier.com/content/subject/scopus?httpAccept=text/xml).
        - isAlias: This parameter controls the default behavior of returning a superseded author profiles. Submitting this parameter as false will override the default behavior. This is only applicable for searches targeting author identifiers.
        - cursor: This parameter is used when a user wants to execute deep pagination searching (i.e. iterate to the end of a search result set). Under normal circumstances, when using the 'start' parameter (results offset), access to the total result set is limited to a predefined maximum number of results. By using the cursor in place of the 'start' the user can iterate to the very end of the result set, with the restriction that results can only be accessed by iterating forward sequentially (there will be no 'prev' or 'last' links available). This capability is initially accessed by sending a "*" in the first search request. Subsequent requests should submit the 'cursor/@next' value from each corresponding response as the 'cursor' value. The navigation links ('next') can also be used to navigate to each succeeding search result entry.
        - facets: Represents the navigator that should be included in the search results. One or more navigators can be specified on the request, delimited by a semicolon Different dimensions of the navigator will be represented within parentheses; ex. facets=authname(count=20,sort=na,prefix=Ma);exactsrctitle (prefix=J);subjarea(sort=fd);pubyear;exactkeyword(sort=fdna)
        - success: Success handler
        - failure: Failure handler

     - SeeAlso:
     https://dev.elsevier.com/documentation/ScopusSearchAPI.wadl
     */
    func search(query: String,
                viewType view: ScopusSearchViewType? = nil,
                field: String? = nil,
                isSuppressNavLinks suppressNavLinks: Bool? = nil,
                date: String? = nil,
                start: Int? = nil,
                count: Int? = nil,
                sortTypes: [SCSortType] = [],
                contentType content: ContentType? = nil,
                subjectType subj: SubjectType? = nil,
                isAlias alias: Bool? = nil,
                cursor: String? = nil,
                facets: String? = nil,
                success: ElsevierKit.SuccessHandler<ScopusSearchModel>? = nil,
                failure: ElsevierKit.FailureHandler? = nil) {

        var parameters: Parameters = Parameters()
        parameters["query"] = query
        parameters["view"] ?= view?.rawValue
        parameters["field"] ?= field
        parameters["suppressNavLinks"] ?= suppressNavLinks?.description
        parameters["date"] ?= date
        parameters["start"] ?= start?.description
        parameters["count"] ?= count?.description
        // Max 3 params
        let sort: String? = !sortTypes.isEmpty ? sortTypes.prefix(3).map { $0.rawValue }.joined(separator: ",") : nil
        parameters["sort"] ?= sort
        parameters["content"] ?= content?.rawValue
        parameters["subj"] ?= subj?.rawValue
        parameters["alias"] ?= alias?.description
        parameters["cursor"] ?= cursor
        parameters["facets"] ?= facets

        ElsevierKit.shared.request(API.Scopus.search,
                                   method: .get,
                                   parameters: parameters,
                                   success: { model in
                                       success?(model)
                                   },
                                   failure: { error in
                                       failure?(error)
                                   })
    }

    // MARK: - Abstract Retrieval API

    /**

     Abstract Retrieval API: This represents retrieval of a SCOPUS abstract by Scopus ID. Each abstract is assigned a unique Scopus identifier (which is also used to create the electronic identifier).

     - Parameters:
         - scopusID: SCOPUS ID
         - field: This alias represents the name of specific fields that should be returned. The list of fields include all of the fields returned in the response payload (see view). Multiple fields can be specified, delimited by commas. Note that specifying this parameter overrides the view parameter.
         - viewType: This alias represents the list of elements that will be returned in the response. The following chart shows the [Abstract Retrieval Views](https://dev.elsevier.com/guides/AbstractRetrievalViews.htm).
         - startref: Applicable only to REF view. Numeric value representing the results offset (i.e. starting position for the resolved references).
         - refcount: Applicable only to REF view. Numeric value representing the maximum number of resolved references to be returned. If not provided this will be set to a system default based on service level.
         - success: Success handler
         - failure: Failure handler

     - SeeAlso:
     https://dev.elsevier.com/documentation/AbstractRetrievalAPI.wadl
     */
    func abstruct(scopusID id: String,
                  field: String? = nil,
                  viewType view: ScopusAbstractRetrievalViewType? = nil,
                  startref: Int? = nil,
                  refcount: Int? = nil,
                  success: ElsevierKit.SuccessHandler<ScopusAbstractRetrievalModel>? = nil,
                  failure: ElsevierKit.FailureHandler? = nil) {

        var parameters: Parameters = Parameters()
        parameters["field"] ?= field
        parameters["view"] ?= view?.rawValue
        parameters["startref"] ?= startref?.description
        parameters["refcount"] ?= refcount?.description

        let url = API.Scopus.abstruct + "/scopus_id/\(id)"
        ElsevierKit.shared.request(url,
                                   method: .get,
                                   parameters: parameters,
                                   success: { model in
                                       success?(model)
                                   },
                                   failure: { error in
                                       failure?(error)
                                   })
    }

    /**

     Abstract Retrieval API: This represents retrieval of a SCOPUS abstract by EID (Electronic Identifier). Each abstract is assigned a unique Scopus identifier which is also used to create the electronic identifier.

     - Parameters:
         - eid: EID (Electronic Identifier)
         - field: This alias represents the name of specific fields that should be returned. The list of fields include all of the fields returned in the response payload (see view). Multiple fields can be specified, delimited by commas. Note that specifying this parameter overrides the view parameter.
         - viewType: This alias represents the list of elements that will be returned in the response. The following chart shows the [Abstract Retrieval Views](https://dev.elsevier.com/guides/AbstractRetrievalViews.htm).
         - startref: Applicable only to REF view. Numeric value representing the results offset (i.e. starting position for the resolved references).
         - refcount: Applicable only to REF view. Numeric value representing the maximum number of resolved references to be returned. If not provided this will be set to a system default based on service level.
         - success: Success handler
         - failure: Failure handler

     - SeeAlso:
     https://dev.elsevier.com/documentation/AbstractRetrievalAPI.wadl
     */
    func abstruct(eid: String,
                  field: String? = nil,
                  viewType view: ScopusAbstractRetrievalViewType? = nil,
                  startref: Int? = nil,
                  refcount: Int? = nil,
                  success: ElsevierKit.SuccessHandler<ScopusAbstractRetrievalModel>? = nil,
                  failure: ElsevierKit.FailureHandler? = nil) {

        var parameters: Parameters = Parameters()
        parameters["field"] ?= field
        parameters["view"] ?= view?.rawValue
        parameters["startref"] ?= startref?.description
        parameters["refcount"] ?= refcount?.description

        let url = API.Scopus.abstruct + "/eid/\(eid)"
        ElsevierKit.shared.request(url,
                                   method: .get,
                                   parameters: parameters,
                                   success: { model in
                                       success?(model)
                                   },
                                   failure: { error in
                                       failure?(error)
                                   })
    }

    /**

     Abstract Retrieval API: This represents retrieval of a SCOPUS abstract by DOI (Document Object Identifier). Note that not every abstract contains a DOI. If only a DOI is available and it cannot be found using this resource, it may still be found by running a Boolean search against the SCIDIR Search API index and using the abstract link (if returned) in those search results.

     - Parameters:
         - doi: DOI (Document Object Identifier)
         - field: This alias represents the name of specific fields that should be returned. The list of fields include all of the fields returned in the response payload (see view). Multiple fields can be specified, delimited by commas. Note that specifying this parameter overrides the view parameter.
         - viewType: This alias represents the list of elements that will be returned in the response. The following chart shows the [Abstract Retrieval Views](https://dev.elsevier.com/guides/AbstractRetrievalViews.htm).
         - startref: Applicable only to REF view. Numeric value representing the results offset (i.e. starting position for the resolved references).
         - refcount: Applicable only to REF view. Numeric value representing the maximum number of resolved references to be returned. If not provided this will be set to a system default based on service level.
         - success: Success handler
         - failure: Failure handler

     - SeeAlso:
     https://dev.elsevier.com/documentation/AbstractRetrievalAPI.wadl
     */
    func abstruct(doi: String,
                  field: String? = nil,
                  viewType view: ScopusAbstractRetrievalViewType? = nil,
                  startref: Int? = nil,
                  refcount: Int? = nil,
                  success: ElsevierKit.SuccessHandler<ScopusAbstractRetrievalModel>? = nil,
                  failure: ElsevierKit.FailureHandler? = nil) {

        var parameters: Parameters = Parameters()
        parameters["field"] ?= field
        parameters["view"] ?= view?.rawValue
        parameters["startref"] ?= startref?.description
        parameters["refcount"] ?= refcount?.description

        let url = API.Scopus.abstruct + "/doi/\(doi)"
        ElsevierKit.shared.request(url,
                                   method: .get,
                                   parameters: parameters,
                                   success: { model in
                                       success?(model)
                                   },
                                   failure: { error in
                                       failure?(error)
                                   })
    }

    /**

     Abstract Retrieval API: This represents retrieval of a SCOPUS abstract by PII (Publication Item Identifier). Note that not every abstract contains a PII. If only a PII is available and it cannot be found using this resource, it may still be found by running a Boolean search against the SCIDIR Search API index and using the abstract link (if returned) in those search results.

     - Parameters:
         - pii: PII (Publication Item Identifier)
         - field: This alias represents the name of specific fields that should be returned. The list of fields include all of the fields returned in the response payload (see view). Multiple fields can be specified, delimited by commas. Note that specifying this parameter overrides the view parameter.
         - viewType: This alias represents the list of elements that will be returned in the response. The following chart shows the [Abstract Retrieval Views](https://dev.elsevier.com/guides/AbstractRetrievalViews.htm).
         - startref: Applicable only to REF view. Numeric value representing the results offset (i.e. starting position for the resolved references).
         - refcount: Applicable only to REF view. Numeric value representing the maximum number of resolved references to be returned. If not provided this will be set to a system default based on service level.
         - success: Success handler
         - failure: Failure handler

     - SeeAlso:
     https://dev.elsevier.com/documentation/AbstractRetrievalAPI.wadl
     */
    func abstruct(pii: String,
                  field: String? = nil,
                  viewType view: ScopusAbstractRetrievalViewType? = nil,
                  startref: Int? = nil,
                  refcount: Int? = nil,
                  success: ElsevierKit.SuccessHandler<ScopusAbstractRetrievalModel>? = nil,
                  failure: ElsevierKit.FailureHandler? = nil) {

        var parameters: Parameters = Parameters()
        parameters["field"] ?= field
        parameters["view"] ?= view?.rawValue
        parameters["startref"] ?= startref?.description
        parameters["refcount"] ?= refcount?.description

        let url = API.Scopus.abstruct + "/pii/\(pii)"
        ElsevierKit.shared.request(url,
                                   method: .get,
                                   parameters: parameters,
                                   success: { model in
                                       success?(model)
                                   },
                                   failure: { error in
                                       failure?(error)
                                   })
    }

    /**

     Abstract Retrieval API: This represents retrieval of a SCOPUS abstract by MEDLINE ID.

     - Parameters:
         - pubmedID: MEDLINE ID
         - field: This alias represents the name of specific fields that should be returned. The list of fields include all of the fields returned in the response payload (see view). Multiple fields can be specified, delimited by commas. Note that specifying this parameter overrides the view parameter.
         - viewType: This alias represents the list of elements that will be returned in the response. The following chart shows the [Abstract Retrieval Views](https://dev.elsevier.com/guides/AbstractRetrievalViews.htm).
         - startref: Applicable only to REF view. Numeric value representing the results offset (i.e. starting position for the resolved references).
         - refcount: Applicable only to REF view. Numeric value representing the maximum number of resolved references to be returned. If not provided this will be set to a system default based on service level.
         - success: Success handler
         - failure: Failure handler

     - SeeAlso:
     https://dev.elsevier.com/documentation/AbstractRetrievalAPI.wadl
     */
    func abstruct(pubmedID id: String,
                  field: String? = nil,
                  viewType view: ScopusAbstractRetrievalViewType? = nil,
                  startref: Int? = nil,
                  refcount: Int? = nil,
                  success: ElsevierKit.SuccessHandler<ScopusAbstractRetrievalModel>? = nil,
                  failure: ElsevierKit.FailureHandler? = nil) {

        var parameters: Parameters = Parameters()
        parameters["field"] ?= field
        parameters["view"] ?= view?.rawValue
        parameters["startref"] ?= startref?.description
        parameters["refcount"] ?= refcount?.description

        let url = API.Scopus.abstruct + "/pubmed_id/\(id)"
        ElsevierKit.shared.request(url,
                                   method: .get,
                                   parameters: parameters,
                                   success: { model in
                                       success?(model)
                                   },
                                   failure: { error in
                                       failure?(error)
                                   })
    }

    /**

     Abstract Retrieval API: This represents retrieval of a SCOPUS abstract by PUI.

     - Parameters:
         - pui: PUI
         - field: This alias represents the name of specific fields that should be returned. The list of fields include all of the fields returned in the response payload (see view). Multiple fields can be specified, delimited by commas. Note that specifying this parameter overrides the view parameter.
         - viewType: This alias represents the list of elements that will be returned in the response. The following chart shows the [Abstract Retrieval Views](https://dev.elsevier.com/guides/AbstractRetrievalViews.htm).
         - startref: Applicable only to REF view. Numeric value representing the results offset (i.e. starting position for the resolved references).
         - refcount: Applicable only to REF view. Numeric value representing the maximum number of resolved references to be returned. If not provided this will be set to a system default based on service level.
         - success: Success handler
         - failure: Failure handler

     - SeeAlso:
     https://dev.elsevier.com/documentation/AbstractRetrievalAPI.wadl
     */
    func abstruct(pui: String,
                  field: String? = nil,
                  viewType view: ScopusAbstractRetrievalViewType? = nil,
                  startref: Int? = nil,
                  refcount: Int? = nil,
                  success: ElsevierKit.SuccessHandler<ScopusAbstractRetrievalModel>? = nil,
                  failure: ElsevierKit.FailureHandler? = nil) {

        var parameters: Parameters = Parameters()
        parameters["field"] ?= field
        parameters["view"] ?= view?.rawValue
        parameters["startref"] ?= startref?.description
        parameters["refcount"] ?= refcount?.description

        let url = API.Scopus.abstruct + "/pui/\(pui)"
        ElsevierKit.shared.request(url,
                                   method: .get,
                                   parameters: parameters,
                                   success: { model in
                                       success?(model)
                                   },
                                   failure: { error in
                                       failure?(error)
                                   })
    }
}
