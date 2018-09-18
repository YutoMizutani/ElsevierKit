//
//  ContentType.swift
//  ElsevierKit
//
//  Created by Yuto Mizutani on 2018/09/18.
//

import Foundation

/**

 This parameter is used to filter specific categories of content that should be searched/returned.

 - SeeAlso:
 https://dev.elsevier.com/documentation/ScopusSearchAPI.wadl
 */
public enum ContentType: String {
    case core, dummy, all
}
