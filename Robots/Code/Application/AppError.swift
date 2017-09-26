//
//  AppError.swift
//  Robots
//
//  Created by Сергей Полозов on 26.09.17.
//  Copyright © 2017 sergey. All rights reserved.
//

import Foundation

enum AppError: Error, LocalizedError {

    case unknown
    case requestError(message: String)

    // MARK: LocalizedError

    var errorDescription: String? {
        switch self {
        case .unknown:
            return .ErrorUnknown
        case .requestError(let message):
            return message
        }
    }
}

enum TransportError: Error {
    case requestFailed(underlyingError: Error)
}

enum DeserializerError: Error {
    case expectedJSONObject
}

enum MapperError: Error {
    case valueMissing(for: String)
    case typeMismatch(for: String, expected: Any.Type, got: Any.Type)
    case invalidDateFormat
}
