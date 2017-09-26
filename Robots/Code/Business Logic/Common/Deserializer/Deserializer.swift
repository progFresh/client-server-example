//
//  Deserializer.swift
//  Robots
//
//  Created by Сергей Полозов on 26.09.17.
//  Copyright © 2017 sergey. All rights reserved.
//

import Foundation

protocol Deserializer {
    func deserialize(data: Data) throws -> ModelDictionary
}
