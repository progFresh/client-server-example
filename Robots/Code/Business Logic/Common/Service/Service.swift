//
//  Service.swift
//  Robots
//
//  Created by Сергей Полозов on 26.09.17.
//  Copyright © 2017 sergey. All rights reserved.
//

import Foundation

protocol Service: class {}

extension Service {
    func handle<T>(result: Result<T>, scheduler: Scheduler, completion: @escaping ResultBlock<T>) {
        scheduler.doOnMainThread {
            completion(result)
        }
    }

    func handle<T>(error: Error, scheduler: Scheduler, completion: @escaping ResultBlock<T>) {
        scheduler.doOnMainThread {
            completion(.failure(error))
        }
    }
}
