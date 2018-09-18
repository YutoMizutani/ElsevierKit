//
//  ElsevierHeader.swift
//  ElsevierKit
//
//  Created by Yuto Mizutani on 2018/09/17.
//

import Alamofire

/// Header params
public struct ElsevierHeader {
    /**
     This represents the acceptable mime types in which the response can be generated. This can also be submitted as the query string parameter "httpAccept". Currently, only JSON format responses are supported.
    */
    public var accept: String = "application/json"

    /**
     This header field contains the OAuth bearer access token in which the format of the field is "Bearer <token>" (where the token represents the end-user session key). The presence of a bearer token implies the request will be executed against user-based entitlements. The Authorization field overrides X-ELS-Authtoken.
    */
    public var authorization: String?

    /**
     This represents a unique application developer key providing access to API resources. This key can also be submitted as the query string parameter "apiKey"
     */
    public var apiKey: String

    /**
     This represents a end-user session. If provided, this token is used to validate the credentials needed to access content in this resource. This token can also be submitted through the HTTP header "Authorization" or the query string parameter "access_token".
     */
    public var authToken: String?

    /**
     This represents a institution token. If provided, this key (in combination with its associated APIKey) is used to establish the credentials needed to access content in this resource. This token can also be provided through the query string parameter "insttoken".
     */
    public var institutionToken: String?

    /**
     This is a client-defined request identifier, which will be logged in all trace messages of the service. This identifier can be used to track a specific transaction in the service's message logs. It will also be returned as an HTTP header in the corresponding response. Note that this should be a unique identifier for the client, and used to track a single transaction.
     */
    public var requestID: String?

    /**
     Represents the version of the resource that should be received. Multiple attributes can

     be submitted by separating with commas or semicolons. Options include:
     */
    public var resourceVersion: String?

    init(apiKey key: String) {
        self.apiKey = key
    }
}

public extension ElsevierHeader {
    /// Create HTTP headers
    func create() -> HTTPHeaders {
        var header = HTTPHeaders()
        header["Accept"] = self.accept
        header["Authorization"] ?= self.authorization
        header["X-ELS-APIKey"] = self.apiKey
        header["X-ELS-Authtoken"] ?= self.authToken
        header["X-ELS-Insttoken"] ?= self.institutionToken
        header["X-ELS-ReqId"] ?= self.requestID
        header["X-ELS-ResourceVersion"] ?= self.resourceVersion
        return header
    }
}
