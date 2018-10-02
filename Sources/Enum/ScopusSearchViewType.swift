//
//  ScopusSearchViewType.swift
//  ElsevierKit
//
//  Created by Yuto Mizutani on 2018/09/18.
//

import Foundation

/**

 This alias represents the list of elements that will be returned in the response.

 The following chart shows the [Scopus Search Views](https://dev.elsevier.com/guides/ScopusSearchViews.htm).

 - SeeAlso:
 https://dev.elsevier.com/documentation/ScopusSearchAPI.wadl
 */
public enum ScopusSearchViewType: String {
    case standard = "STANDARD"
    case complete = "COMPLETE"
}
