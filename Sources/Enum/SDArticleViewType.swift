//
//  SDArticleViewType.swift
//  ElsevierKit
//
//  Created by Yuto Mizutani on 2018/10/03.
//

import Foundation

/**

 This alias represents the list of elements that will be returned in the response.

 The following chart shows the [Article Retrieval Views](https://dev.elsevier.com/guides/ArticleRetrievalViews.htm).

 - SeeAlso:
 https://dev.elsevier.com/documentation/ArticleRetrievalAPI.wadl
 */
public enum SDArticleViewType: String {
    case meta = "META"
    case metaAbs = "META_ABS"
    case metaAbsRef = "META_ABS_REF"
    case full = "FULL"
    case ref = "REF"
    case entitled = "ENTITLED"
}
