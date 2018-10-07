//
//  EngineeringVillageSearchModel.swift
//  ElsevierKit
//
//  Created by Yuto Mizutani on 2018/09/30.
//

import Foundation

/**
 Engineering Village Search Model
 */
public struct EngineeringVillageSearchModel: Codable {
    public let page: Page

    public struct Page: Codable {
        public let resultsCount: Int
        public let resultsPerPage: Int
        public let pageResults: PageResults

        public struct PageResults: Codable {
            public let pageEntry: [PageEntry]

            public struct PageEntry: Codable {
                public let eiDocument: EiDocument

                public struct EiDocument: Codable {
                    public let documentproperties: Documentproperties
                    public let documentobjects: Documentobjects
                    public let doc: Doc
                    public let view: String
                    public let ft: Ft
                    public let afs: Afs
                    public let aus: Aus

                    public struct Documentproperties: Codable {
                        public let dt: String?
                        public let articleNumber: String?
                        public let cn: String?
                        public let pp: String?
                        public let cprt: String
                        public let sd: String
                        public let se: String?
                        public let ril: String?
                        public let rct: String?
                        public let cpr: String
                        public let loadNo: String
                        public let ti: String
                        public let vo: String?
                        public let pPp: String?
                        public let mt: String?
                        public let `do`: String?
                        public let yr: String?
                        public let la: String?
                        public let sn: String?
                        public let so: String
                        public let pn: String?

                        private enum CodingKeys: String, CodingKey {
                            case cprt = "CPRT"
                            case sd = "SD"
                            case se = "SE"
                            case ril = "RIL"
                            case cpr = "CPR"
                            case loadNo = "LOAD-NO"
                            case ti = "TI"
                            case vo = "VO"
                            case pPp = "P_PP"
                            case `do` = "DO"
                            case sn = "SN"
                            case so = "SO"
                            case pp = "PP"
                            case rct = "RCT"
                            case dt = "DT"
                            case yr = "YR"
                            case pn = "PN"
                            case articleNumber = "ARTICLE_NUMBER"
                            case cn = "CN"
                            case la = "LA"
                            case mt = "MT"
                        }
                    }

                    public struct Documentobjects: Codable {
                        public let citedby: Citedby

                        public struct Citedby: Codable {
                            public let pii: String?
                            public let issn: String?
                            public let firstissue: String?
                            public let firstvolume: String?
                            public let firstpage: String?
                            public let isbn13: String?
                            public let doi: String?

                            private enum CodingKeys: String, CodingKey {
                                case issn = "ISSN"
                                case firstissue = "FIRSTISSUE"
                                case firstvolume = "FIRSTVOLUME"
                                case firstpage = "FIRSTPAGE"
                                case doi = "DOI"
                                case pii = "PII"
                                case isbn13 = "ISBN13"
                            }
                        }

                        private enum CodingKeys: String, CodingKey {
                            case citedby = "CITEDBY"
                        }
                    }

                    public struct Doc: Codable {
                        public let docId: String
                        public let hitindex: Int
                        public let db: Db

                        public struct Db: Codable {
                            public let dbname: String
                            public let id: String

                            private enum CodingKeys: String, CodingKey {
                                case dbname = "DBNAME"
                                case id = "ID"
                            }
                        }

                        private enum CodingKeys: String, CodingKey {
                            case docId = "DOC-ID"
                            case hitindex = "HITINDEX"
                            case db = "DB"
                        }
                    }

                    public struct Ft: Codable {
                        public let ftlink: String

                        private enum CodingKeys: String, CodingKey {
                            case ftlink = "FTLINK"
                        }
                    }

                    public struct Afs: Codable {
                        public let af: [Af]

                        public struct Af: Codable {
                            public let id: String
                            public let name: String

                            private enum CodingKeys: String, CodingKey {
                                case id = "ID"
                                case name = "NAME"
                            }
                        }

                        private enum CodingKeys: String, CodingKey {
                            case af = "AF"
                        }
                    }

                    public struct Aus: Codable {
                        public let au: [Au]

                        public struct Au: Codable {
                            public let id: String
                            public let email: String?
                            public let afs: Afs
                            public let name: String

                            public struct Afs: Codable {
                                public let afid: [String]?
//                                public let afid: String?
//                                public let afid: [Int]?

                                private enum CodingKeys: String, CodingKey {
                                    case afid = "AFID"
                                }
                            }

                            private enum CodingKeys: String, CodingKey {
                                case id = "ID"
                                case email = "EMAIL"
                                case afs = "AFS"
                                case name = "NAME"
                            }
                        }

                        private enum CodingKeys: String, CodingKey {
                            case au = "AU"
                        }
                    }

                    private enum CodingKeys: String, CodingKey {
                        case documentproperties = "DOCUMENTPROPERTIES"
                        case documentobjects = "DOCUMENTOBJECTS"
                        case doc = "DOC"
                        case view = "VIEW"
                        case ft = "FT"
                        case afs = "AFS"
                        case aus = "AUS"
                    }
                }

                private enum CodingKeys: String, CodingKey {
                    case eiDocument = "EI-DOCUMENT"
                }
            }

            private enum CodingKeys: String, CodingKey {
                case pageEntry = "PAGE-ENTRY"
            }
        }

        private enum CodingKeys: String, CodingKey {
            case resultsCount = "RESULTS-COUNT"
            case resultsPerPage = "RESULTS-PER-PAGE"
            case pageResults = "PAGE-RESULTS"
        }
    }

    private enum CodingKeys: String, CodingKey {
        case page = "PAGE"
    }
}
