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

enum URLString {
    static let robots = "https://agency5-mobile-school.firebaseio.com/data.json"
}

enum ServerField: String {
    case items
    case about
    case address
    case company
    case email
    case first_name
    case id
    case last_name
    case phone
    case photo
}
