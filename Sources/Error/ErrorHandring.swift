//
//  ErrorHandring.swift
//  ElsevierKit
//
//  Created by Yuto Mizutani on 2018/09/17.
//

import Foundation

/// ElsevierKit errors
public enum ElsevierKitError: Error {

    /// Not authorization yet
    case noAuthorization

    /// Empty parameters
    case emptyParameters

    /// Decode error
    case decoding(message: String)
}
