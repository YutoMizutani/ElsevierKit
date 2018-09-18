//
//  PlatformType.swift
//  ElsevierKit
//
//  Created by Yuto Mizutani on 2018/09/16.
//

import Foundation

/**

 Indicates the application platform that should be authenticated; default: scienceDirect

 - SeeAlso:
 https://dev.elsevier.com/documentation/AuthenticationAPI.wadl
 */
public enum PlatformType: String {

    /// Science Direct
    case scienceDirect = "SCIDIR"

    /// Scopus
    case scopus = "SCOPUS"

    /// Engineering Village
    case engineeringVillage = "EV"

    /// Embase
    case embase = "EMBASE"
}
