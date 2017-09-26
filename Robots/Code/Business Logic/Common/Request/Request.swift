//
//  Request.swift
//  Robots
//
//  Created by Сергей Полозов on 26.09.17.
//  Copyright © 2017 sergey. All rights reserved.
//

import Foundation
import Alamofire

typealias RequestMethod = HTTPMethod

protocol Request: URLRequestConvertible {
    var path: String { get }
    var method: RequestMethod { get }
    var headers: [String: String] { get }
    var parameters: [String : Any] { get }
}

// MARK: URLRequestConvertible
extension Request {
    public func asURLRequest() throws -> URLRequest {
        let url = try path.asURL()
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        for (key, value) in headers {
            request.addValue(value, forHTTPHeaderField: key)
        }
        return try URLEncoding.default.encode(request, with: parameters)
    }
}
