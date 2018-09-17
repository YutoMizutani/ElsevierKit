//
//  Authenticate.swift
//  ElsevierKit
//
//  Created by Yuto Mizutani on 2018/09/16.
//

import Alamofire

public extension ElsevierKitAuthenticate {

    /**

     This represents interfaces to create a secured authtoken.

     - Parameters:
         - apiKey: This represents a unique application developer key providing access to API resources.
         - platform: Indicates the application platform that should be authenticated.
         - success: Success handler
         - failure: Failure handler

     - SeeAlso:
     https://dev.elsevier.com/documentation/AuthenticationAPI.wadl
     */
    func authenticate(apiKey key: String,
                      platform: PlatformType? = nil,
                      success: ElsevierKit.EmptySuccessHandler? = nil,
                      failure: ElsevierKit.FailureHandler? = nil) {

        let elsevier: ElsevierKit = ElsevierKit.shared
        elsevier.header = ElsevierHeader(apiKey: key)

        var parameters: Parameters = Parameters()
        parameters["platform"] ?= platform?.rawValue

        let authHandler: ElsevierKit.SuccessHandler<AuthenticateModel> = { model in
            // Set authorization token
            elsevier.header?.authToken = model.authenticateResponse.authToken
            success?()
        }

        ElsevierKit.shared.request(API.authentication,
                                   parameters: parameters,
                                   success: { model in
                                       authHandler(model)
                                   },
                                   failure: { error in
                                       failure?(error)
                                   })
    }    
}
