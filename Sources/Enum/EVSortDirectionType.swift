//
//  EVSortDirectionType.swift
//  ElsevierKit
//
//  Created by Yuto Mizutani on 2018/09/25.
//

import Foundation

/**

 Sort direction. Default setting is "dw" if parameter is not provided

 - SeeAlso:
 https://dev.elsevier.com/documentation/EngineeringVillageAPI.wadl
 */
public enum EVSortDirectionType: String {
    /// Down
    case down = "dw"
    /// Up
    case up = "up"
}
