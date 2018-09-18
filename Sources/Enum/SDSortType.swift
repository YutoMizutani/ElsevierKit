//
//  SDSortType.swift
//  ElsevierKit
//
//  Created by Yuto Mizutani on 2018/09/17.
//

import Foundation

/**

 How results should be sorted. Default: relevance.

 - SeeAlso:
 https://dev.elsevier.com/tecdoc_sdsearch_migration.html
 */
public enum SDSortType: String {
    case relevance, date
}
