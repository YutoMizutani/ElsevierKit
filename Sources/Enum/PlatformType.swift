//
//  PlatformType.swift
//  ElsevierKit
//
//  Created by Yuto Mizutani on 2018/09/16.
//

import Foundation

/**

 Indicates the application platform that should be authenticated.

 - SeeAlso:
 https://dev.elsevier.com/documentation/AuthenticationAPI.wadl
 */
public enum PlatformType: String {
    case scienceDirect = "SCIDIR"
    case scopus = "SCOPUS"
    case engineeringVillage = "EV"
    case embase = "EMBASE"
}
