//
//  ResourceVersionType.swift
//  ElsevierKit
//
//  Created by Yuto Mizutani on 2018/09/18.
//

import Foundation

/**

 Represents the version of the resource that should be received. Multiple attributes can

 be submitted by separating with commas or semicolons.

 - SeeAlso:
 https://dev.elsevier.com/documentation/ScopusSearchAPI.wadl
 */
public enum ResourceVersionType: String {

    /// adds new fields under each facet returned (where applicable)
    case facetexpand

    /// (same as facetexpand)
    case allexpand

    /// returns the most recent and prototyped features
    case new
}
