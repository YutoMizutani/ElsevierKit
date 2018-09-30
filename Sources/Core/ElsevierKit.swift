//
//  ElsevierKit.swift
//  ElsevierKit
//
//  Created by Yuto Mizutani on 2018/09/16.
//

import Alamofire

/// A set of helper functions to make the Instagram API easier to use.
public class ElsevierKit {

    /// Elsevier Authentication
    public let auth = ElsevierKitAuthenticate.shared

    /// Elsevier ScienceDirect
    public let scienceDirect = ElsevierKitScienceDirect.shared

    /// Elsevier Scopus
    public let scopus = ElsevierKitScopus.shared

    /// Engineering Village
    public let engineeringVillage = ElsevierKitEngineeringVillage.shared

    // MARK: - Types

    /// Empty success handler
    public typealias EmptySuccessHandler = () -> Void

    /// Success handler
    public typealias SuccessHandler<T> = (_ model: T) -> Void

    /// Failure handler
    public typealias FailureHandler = (_ error: Error) -> Void

    // MARK: - Initializers

    /// Returns a shared instance of ElsevierKit
    public static let shared = ElsevierKit()

    /// Use of Singleton pattern with private access
    private init() {}

    // MARK: - Token

    /// HTTP Header
    public var header: ElsevierHeader?

    // MARK: - Requests

    /**
     Request

     - Parameters:
         - url: API URL
         - method: HTTP method
         - parameters: Query parameters
         - encoding: Parameter encoding
         - success: Success handler
         - failure: Failure handler
     */
    func request<T: Decodable>(_ url: String,
                               method: HTTPMethod = .get,
                               parameters: Parameters? = nil,
                               encoding: ParameterEncoding = URLEncoding.default,
                               success: SuccessHandler<T>?,
                               failure: FailureHandler?) {

        guard let headers = self.header?.create() else {
            failure?(ElsevierKitError.noAuthorization)
            return
        }

        Alamofire.request(url, method: method, parameters: parameters, encoding: encoding, headers: headers)
            .responseData { response in
                switch response.result {
                case .success:
                    guard let success = success, let data = response.data else { return }
                    let decoder: JSONDecoder = JSONDecoder()
                    do {
                        let model = try decoder.decode(T.self, from: data)
                        success(model)
                    } catch let error {
                        failure?(ElsevierKitError.decoding(message: error.localizedDescription))
                    }
                case .failure(let error):
                    failure?(error)
                }
            }
    }
}
