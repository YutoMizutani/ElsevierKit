//
//  SubjectType.swift
//  ElsevierKit
//
//  Created by Yuto Mizutani on 2018/09/18.
//

import Foundation

/**

 Represents the subject area code associated with the content category desired. Note that these subject code mapping vary based upon the environment in which the request is executed.

 The following resource shows all of the available subject classifications.

 - SeeAlso:
 https://dev.elsevier.com/documentation/ScopusSearchAPI.wadl
 */
public enum SubjectType: String {
    /// Agricultural and Biological Sciences
    case agriculturalAndBiologicalSciences = "AGRI"
    /// Arts and Humanities
    case artsAndHumanities = "ARTS"
    /// Biochemistry, Genetics and Molecular Biology
    case biochemistryGeneticsAndMolecularBiology = "BIOC"
    /// Business, Management and Accounting
    case businessManagementAndAccounting = "BUSI"
    /// Chemical Engineering
    case chemicalEngineering = "CENG"
    /// Chemistry
    case chemistry = "CHEM"
    /// Computer Science
    case computerScience = "COMP"
    /// Decision Sciences
    case decisionSciences = "DECI"
    /// Dentistry
    case dentistry = "DENT"
    /// Earth and Planetary Sciences
    case earthAndPlanetarySciences = "EART"
    /// Economics, Econometrics and Finance
    case economicsEconometricsAndFinance = "ECON"
    /// Energy
    case energy = "ENER"
    /// Engineering
    case engineering = "ENGI"
    /// Environmental Science
    case environmentalScience = "ENVI"
    /// Health Professions
    case healthProfessions = "HEAL"
    /// Immunology and Microbiology
    case immunologyAndMicrobiology = "IMMU"
    /// Materials Science
    case materialsScience = "MATE"
    /// Mathematics
    case mathematics = "MATH"
    /// Medicine
    case medicine = "MEDI"
    /// Neuroscience
    case neuroscience = "NEUR"
    /// Nursing
    case nursing = "NURS"
    /// Pharmacology, Toxicology and Pharmaceutics
    case pharmacologyToxicologyAndPharmaceutics = "PHAR"
    /// Physics and Astronomy
    case physicsAndAstronomy = "PHYS"
    /// Psychology
    case psychology = "PSYC"
    /// Social Sciences
    case socialSciences = "SOCI"
    /// Veterinary
    case veterinary = "VETE"
    /// Multidisciplinary
    case multidisciplinary = "MULT"
}
