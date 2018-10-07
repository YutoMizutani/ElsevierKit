//
//  EVSortFieldType.swift
//  ElsevierKit
//
//  Created by Yuto Mizutani on 2018/09/25.
//

import Foundation

/**

 Sort Field, which can vary by database. Default setting is relevance if parameter is not provided. See [here](http://help.engineeringvillage.com/Engineering_Village_Help_CSH.htm#Sort_by.htm) for more information.

 - SeeAlso:
 https://dev.elsevier.com/documentation/EngineeringVillageAPI.wadl
 */
public enum EVSortFieldType: String {
    /// Relevance
    case relevance
    /// Date (year)
    case year = "yr"
    /// Author
    case author = "ausort"
    /// Source
    case source = "stsort"
    /// Publisher
    case publisher = "pnsort"
    /// Patent cited by
    case patentCitedBy = "pcb"
}
