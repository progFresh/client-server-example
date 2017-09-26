//
//  Transport.swift
//  Robots
//
//  Created by Сергей Полозов on 26.09.17.
//  Copyright © 2017 sergey. All rights reserved.
//

import Foundation

typealias TransportResultBlock = (Result<Data>) -> Void

protocol Transport: class {
    func perform(urlRequest: URLRequest, completion: @escaping TransportResultBlock)
}

extension Transport {
    func perform(request: Request, completion: @escaping TransportResultBlock) {
        do {
            let urlRequest = try request.asURLRequest()
            perform(urlRequest: urlRequest, completion: completion)
        } catch {
            completion(.failure(error))
        }
    }
}
