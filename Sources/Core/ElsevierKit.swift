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

    // MARK: - Requests

    /**
     Request

     - Parameters:
     - url: API URL
     - method: HTTP method
     - parameters: Query parameters
     - headers: HTTP headers
     - success: Success handler
     - failure: Failure handler
     */
    func request<T: Decodable>(_ url: String,
                               method: HTTPMethod = .get,
                               parameters: Parameters? = nil,
                               headers: HTTPHeaders? = nil,
                               success: SuccessHandler<T>?,
                               failure: FailureHandler?) {

        var headers = headers ?? HTTPHeaders()
        headers["User-Agent"] = headers["User-Agent"] ?? "ElsevierKit"
        headers["Accept"] = "application/json"

        Alamofire.request(url, method: method, parameters: parameters, encoding: URLEncoding.default, headers: headers)
            .responseData { response in
                switch response.result {
                case .success:
                    guard let success = success, let data = response.data else { return }
                    let decoder: JSONDecoder = JSONDecoder()
                    guard let model = try? decoder.decode(T.self, from: data) else { return }
                    success(model)
                case .failure(let error):
                    failure?(error)
                }
        }
    }
}
