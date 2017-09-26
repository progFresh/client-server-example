//
//  Repository.swift
//  Robots
//
//  Created by Сергей Полозов on 26.09.17.
//  Copyright © 2017 sergey. All rights reserved.
//

import Foundation

protocol Repository: class {}

extension Repository {
    func handle<T>(result: Result<T>, completion: @escaping (Result<T>) -> Void) {
        completion(result)
    }

    func handle<T>(success value: T, completion: @escaping (Result<T>) -> Void) {
        completion(.success(value))
    }

    func handle<T>(error: Error, completion: @escaping (Result<T>) -> Void) {
        completion(.failure(error))
    }
}
