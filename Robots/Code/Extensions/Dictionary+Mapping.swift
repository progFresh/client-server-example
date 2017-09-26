//
//  Dictionary+Mapping.swift
//  Robots
//
//  Created by Сергей Полозов on 26.09.17.
//  Copyright © 2017 sergey. All rights reserved.
//

import Foundation

extension Dictionary where Key == String {
    func field<T>(for key: Key) throws -> T {
        guard let mappedField = self[key] else {
            throw MapperError.valueMissing(for: key)
        }
        guard let mappedFieldOfType = mappedField as? T else {
            throw MapperError.typeMismatch(for: key.description, expected: T.self, got: type(of: mappedField))
        }
        return mappedFieldOfType
    }

    func field<T>(for serverField: ServerField) throws -> T {
        return try field(for: serverField.rawValue)
    }

    func fieldAsNullable<T>(for key: Key) throws -> T? {
        guard let mappedField = self[key] else {
            throw MapperError.valueMissing(for: key)
        }
        guard let mappedFieldOfType = mappedField as? T else {
            return nil
        }
        return mappedFieldOfType
    }

    func fieldAsNullable<T>(for serverField: ServerField) throws -> T? {
        return try fieldAsNullable(for: serverField.rawValue)
    }
}
