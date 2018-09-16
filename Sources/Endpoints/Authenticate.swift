//
//  Authenticate.swift
//  ElsevierKit
//
//  Created by Yuto Mizutani on 2018/09/16.
//

import Alamofire

public extension ElsevierKitAuthenticate {
    /// https://dev.elsevier.com/documentation/AuthenticationAPI.wadl
    func authenticate(apiKey key: String,
                      institutionToken token: String? = nil,
                      platform: PlatformType? = nil,
                      success: ElsevierKit.SuccessHandler<AuthenticateModel>? = nil,
                      failure: ElsevierKit.FailureHandler? = nil) {

        var parameters: Parameters = Parameters()
        parameters["platform"] ?= platform?.rawValue

        var headers: HTTPHeaders = HTTPHeaders()
        headers["X-ELS-APIKey"] = key
        headers["X-ELS-Insttoken"] ?= token

        ElsevierKit.shared.request(API.Authenticate,
                                   parameters: parameters,
                                   headers: headers,
                                   success: { model in
                                       success?(model)
                                   },
                                   failure: { error in
                                       failure?(error)
                                   })
    }    
}
