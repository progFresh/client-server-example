//
//  Constants.swift
//  Robots
//
//  Created by Сергей Полозов on 25.09.17.
//  Copyright © 2017 sergey. All rights reserved.
//

import UIKit

typealias Block = () -> Void
typealias ModelDictionary = [String: Any]
typealias ResultBlock<T> = (Result<T>) -> Void

extension TimeInterval {
    static let requestTimeout: TimeInterval = 10
}

enum ServerField: String {
    case items
}
