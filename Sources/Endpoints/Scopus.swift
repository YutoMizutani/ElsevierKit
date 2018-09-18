//
//  Scopus.swift
//  ElsevierKit
//
//  Created by Yuto Mizutani on 2018/09/18.
//

import Alamofire

public extension ElsevierKitScopus {

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
                viewType view: ViewType? = nil,
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
}
