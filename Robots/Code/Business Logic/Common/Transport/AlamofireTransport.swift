//
//  AlamofireTransport.swift
//  Robots
//
//  Created by Сергей Полозов on 26.09.17.
//  Copyright © 2017 sergey. All rights reserved.
//

import Foundation
import Alamofire

final class AlamofireTransport: Transport {

    // MARK: Private Properties

    private let sessionManager: SessionManager

    // MARK: Initialization

    init() {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForResource = .requestTimeout
        sessionManager = SessionManager(configuration: configuration)
    }

    // MARK: Transport

    func perform(urlRequest: URLRequest, completion: @escaping TransportResultBlock) {
        sessionManager.request(urlRequest).responseData { [weak self] response in
            self?.handle(transportResponse: response, completion: completion)
        }
    }

    // MARK: Private Helpers

    private func handle(
        transportResponse: DataResponse<Data>,
        completion: @escaping TransportResultBlock
        ) {
        switch transportResponse.result {
        case .success(let data):
            completion(.success(data))
        case .failure(let error):
            let requestError = TransportError.requestFailed(underlyingError: error)
            completion(.failure(requestError))
        }
    }
}
