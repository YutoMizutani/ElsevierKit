//
//  SCSortType.swift
//  ElsevierKit
//
//  Created by Yuto Mizutani on 2018/09/18.
//

import Foundation

/**

 Represents the sort field name and order. A plus in front of the sort field name indicates ascending order, a minus indicates descending order. If sort order is not specified (i.e. no + or -) then the order defaults to ascending (ASC).

 Up to three fields can be specified, each delimited by a comma. The precedence is determined by their order (i.e. first is primary, second is secondary, and third is tertiary).

 +/-{field name}[,+/-{field name}

 ex. sort=coverDate,-title

 - SeeAlso:
 https://dev.elsevier.com/documentation/ScopusSearchAPI.wadl
 */
public enum SCSortType: String {
    case artnumAscending = "+artnum"
    case artnumDescending = "-artnum"
    case citedByCountAscending = "+citedby-count"
    case citedByCountDescending = "-citedby-count"
    case coverDateAscending = "+coverDate"
    case coverDateDescending = "-coverDate"
    case creatorAscending = "+creator"
    case creatorDescending = "-creator"
    case origLoadDateAscending = "+orig-load-date"
    case origLoadDateDescending = "-orig-load-date"
    case pageCountAscending = "+pagecount"
    case pageCountDescending = "-pagecount"
    case pageFirstAscending = "+pagefirst"
    case pageFirstDescending = "-pagefirst"
    case pageRangeAscending = "+pageRange"
    case pageRangeDescending = "-pageRange"
    case publicationNameAscending = "+publicationName"
    case publicationNameDescending = "-publicationName"
    case pubYearAscending = "+pubyear"
    case pubYearDescending = "-pubyear"
    case relevancyAscending = "+relevancy"
    case relevancyDescending = "-relevancy"
    case volumeAscending = "+volume"
    case volumeDescending = "-volume"
}
