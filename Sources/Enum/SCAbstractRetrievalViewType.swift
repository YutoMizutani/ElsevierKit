//
//  SCAbstractRetrievalViewType.swift
//  ElsevierKit iOS
//
//  Created by Yuto Mizutani on 2018/10/02.
//

import Foundation

/**

 This alias represents the list of elements that will be returned in the response.

 The following chart shows the [Abstract Retrieval Views](https://dev.elsevier.com/guides/AbstractRetrievalViews.htm).

 - SeeAlso:
 https://dev.elsevier.com/documentation/ScopusSearchAPI.wadl
 */
public enum SCAbstractRetrievalViewType: String {
    case meta = "META"
    case metaAbs = "META_ABS"
    case full = "FULL"
    case ref = "REF"
    case entitled = "ENTITLED"
}
