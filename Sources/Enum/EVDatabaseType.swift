//
//  EVDatabaseType.swift
//  ElsevierKit
//
//  Created by Yuto Mizutani on 2018/09/19.
//

import Foundation

/**

 Database codes

 - SeeAlso:
 https://dev.elsevier.com/documentation/EngineeringVillageAPI.wadl
 */
public enum EVDatabaseType: String {
    /// Compendex/EI Backfile
    case eiCompendex = "c"
    /// Inspec/Inspec Archive
    case inspec = "i"
    /// NTIS
    case ntis = "n"
    /// Paperchem
    case paperchem = "pc"
    /// Chimica
    case chimica = "cm"
    /// CBNB
    case cbnb = "cb"
    /// EnCompassLIT
    case enCompassLIT = "el"
    /// EnCompassPAT
    case enCompassPAT = "ep"
    /// GEOBASE
    case geobase = "g"
    /// GeoRef
    case geoRef = "f"
    /// US Patents
    case usParents = "u"
    /// EP Patents
    case epParents = "e"
}
