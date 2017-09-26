//
//  NetworkRepository.swift
//  Robots
//
//  Created by Сергей Полозов on 26.09.17.
//  Copyright © 2017 sergey. All rights reserved.
//

import Foundation

protocol NetworkRepository: Repository {}

extension NetworkRepository {
    func dataDictionary(from result: Result<Data>, using deserializer: Deserializer) throws -> ModelDictionary {
        let data = try result.dematerialize()
        let responseDictionary = try deserializer.deserialize(data: data)
        return responseDictionary
    }
}
