//
//  RobotsNetworkRepository.swift
//  Robots
//
//  Created by Сергей Полозов on 26.09.17.
//  Copyright © 2017 sergey. All rights reserved.
//

import Foundation

final class RobotsNetworkRepository: RobotsRepository, NetworkRepository {

    // MARK: Private Properties

    private let transport: Transport
    private let deserializer: Deserializer

    // MARK: Initialization

    init(transport: Transport, deserializer: Deserializer) {
        self.transport = transport
        self.deserializer = deserializer
    }

    // MARK: RobotRepository

    func getRobots(completion: @escaping RobotsResultBlock) {
        let request = RobotRequest()
        transport.perform(request: request) { [weak self] result in
            self?.handle(robotResult: result, completion: completion)
        }
    }

    // MARK: Private Helpers

    private func handle(robotResult result: Result<Data>, completion: @escaping RobotsResultBlock) {
        let result = Result { () -> [Robot] in
            let responseDictionary = try dataDictionary(from: result, using: deserializer)
            let itemsDictionaries: [ModelDictionary] = try responseDictionary.field(for: .items)
            let robots = try itemsDictionaries.map { try Robot(modelDictionary: $0) }
            return robots
        }
        handle(result: result, completion: completion)
    }
}
