//
//  JSONDeserializer.swift
//  Robots
//
//  Created by Сергей Полозов on 26.09.17.
//  Copyright © 2017 sergey. All rights reserved.
//

import Foundation

final class JSONDeserializer: Deserializer {
    func deserialize(data: Data) throws -> ModelDictionary {
        let json = try JSONSerialization.jsonObject(with: data, options: [])
        guard let modelDictionary = json as? ModelDictionary else {
            throw DeserializerError.expectedJSONObject
        }
        return modelDictionary
    }
}
