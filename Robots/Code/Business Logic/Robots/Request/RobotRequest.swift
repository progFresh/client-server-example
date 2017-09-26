//
//  RobotRequest.swift
//  Robots
//
//  Created by Сергей Полозов on 26.09.17.
//  Copyright © 2017 sergey. All rights reserved.
//

import Foundation

struct RobotRequest: Request {

    var path: String {
        return URLString.robots
    }

    var method: RequestMethod {
        return .get
    }

    var headers: [String: String] {
        return [:]
    }

    var parameters: [String : Any] {
        return [:]
    }
}
