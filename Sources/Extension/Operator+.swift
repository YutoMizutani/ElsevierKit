//
//  Operator+.swift
//  ElsevierKit
//
//  Created by Yuto Mizutani on 2018/09/16.
//

import Foundation

/// Optional assignment operator
infix operator ?=

/// Optional assignment
func ?=<T> (lhs: inout T, rhs: T?) {
    if let rhs = rhs {
        lhs = rhs
    }
}
