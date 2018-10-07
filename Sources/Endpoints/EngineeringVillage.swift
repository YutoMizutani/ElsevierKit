//
//  EngineeringVillage.swift
//  ElsevierKit
//
//  Created by Yuto Mizutani on 2018/09/19.
//

import Alamofire

public extension ElsevierKitEngineeringVillage {

    /**

     This represents the available REST interfaces associated with Engineering Village searches.
     Interactive Swagger documentation can be found [here](https://api.engineeringvillage.com/EvDataWebServices/swagger-ui.html) along with the [Swagger definition](https://api.engineeringvillage.com/EvDataWebServices/v2/api-docs?group=00-ev-search-api)

     - Parameters:
         - query: Expert search phrase which cannot be blank and cannot contain only * and whitespace characters. See help topics here for searching specific [fields](https://service.elsevier.com/app/home/supporthub/engineering-village/Engineering_Village_Help_CSH.htm#Expert_Search_Fields_and_Fields_Codes.htm), and for using [proximity/near operators](http://help.engineeringvillage.com/Engineering_Village_Help_CSH.htm#Proximity_Near_Operator_.htm), [Boolean operators](http://help.engineeringvillage.com/Engineering_Village_Help_CSH.htm#Boolean_Operators.htm), [exact phrases](http://help.engineeringvillage.com/Engineering_Village_Help_CSH.htm#Exact_Phrase_Searching.htm), [special characters](http://help.engineeringvillage.com/Engineering_Village_Help_CSH.htm#Special_Characters.htm), [wildcards and truncation](http://help.engineeringvillage.com/Engineering_Village_Help_CSH.htm#Wildcards_and_Truncation.htm), and [stop words](http://help.engineeringvillage.com/Engineering_Village_Help_CSH.htm#Stop_Words.htm)
         - database: List of databases to query. When no databases are specified, all databases to which application account is entitles are searched.
         - isNavigator: Navigator, a setting which determines if navigators should be returned if a is performed on search words, defaults to false if not set
         - navigatorDataCount: Navigator data count, a setting which determines how many records for the navigator should be returned, minimum is 1 maximum is 160, default is 10
         - isAutoStemming: [Autostemming](http://help.engineeringvillage.com/Engineering_Village_Help_CSH.htm#Autostemming.htm) a setting which determines if stemming is performed on search words, defaults to false if not set
         - startYear: Start year, leave blank if providing updateNumber
         - endYear: End year, leave blank if providing updateNumber
         - updateNumber: Update week number, find records updated within the last N weeks; 1 <= N <=4, leave blank when setting startYear or endYear. See [here](http://help.engineeringvillage.com/Engineering_Village_Help_CSH.htm#Date_Limits.htm) for more information.
         - sortField: Sort Field, which can vary by database. Default setting is relevance if parameter is not provided. See [here](http://help.engineeringvillage.com/Engineering_Village_Help_CSH.htm#Sort_by.htm) for more information.
         - sortDirection: Sort direction. Default setting is "dw" if parameter is not provided
         - offset: Page offset, used for pagination. To get page N, set offset = (N-1) * Page size. Defaults to 0 if not set.
         - pageSize: Requested page size, defaults to 25 if not set. Used for pagination with offset parameter. Actual page size will be set to the results count if the results count is less than the requested page size
         - success: Success handler
         - failure: Failure handler

     - SeeAlso:
     https://dev.elsevier.com/documentation/EngineeringVillageAPI.wadl
     */
    func search(query: String,
                databaseTypes: [EVDatabaseType] = [],
                isNavigator navigator: Bool? = nil,
                navigatorDataCount: Int? = nil,
                isAutoStemming autoStemming: Bool? = nil,
                startYear: Int? = nil,
                endYear: Int? = nil,
                updateNumber: Int? = nil,
                sortField: EVSortFieldType? = nil,
                sortDirection: EVSortDirectionType? = nil,
                offset: Int? = nil,
                pageSize: Int? = nil,
                success: ElsevierKit.SuccessHandler<EngineeringVillageSearchModel>? = nil,
                failure: ElsevierKit.FailureHandler? = nil) {

        var parameters: Parameters = Parameters()
        parameters["query"] = query
        let database: String? = !databaseTypes.isEmpty ? databaseTypes.map { $0.rawValue }.joined(separator: ",") : nil
        parameters["database"] ?= database
        parameters["navigator"] ?= navigator
        parameters["navigatorDataCount"] ?= navigatorDataCount
        parameters["autoStemming"] ?= autoStemming
        parameters["startYear"] ?= startYear
        parameters["endYear"] ?= endYear
        parameters["updateNumber"] ?= updateNumber
        parameters["sortField"] ?= sortField?.rawValue
        parameters["sortDirection"] ?= sortDirection?.rawValue
        parameters["offset"] ?= offset
        parameters["pageSize"] ?= pageSize

        ElsevierKit.shared.request(API.EngineeringVillage.search,
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
