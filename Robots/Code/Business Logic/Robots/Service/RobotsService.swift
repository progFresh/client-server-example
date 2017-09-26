//
//  RobotsService.swift
//  Robots
//
//  Created by Сергей Полозов on 26.09.17.
//  Copyright © 2017 sergey. All rights reserved.
//

import Foundation

typealias RobotsResultBlock = (Result<[Robot]>) -> Void
typealias RobotResult = Result<[Robot]>

protocol RobotsService: Service {
    func getRobots(completion: @escaping RobotsResultBlock)
}

final class RobotsServiceImpl: RobotsService {

    // MARK: Private Helpers

    private let scheduler: Scheduler
    private let networkRepository: RobotsRepository

    // MARK: Initialization

    init(scheduler: Scheduler, networkRepository: RobotsRepository) {
        self.scheduler = scheduler
        self.networkRepository = networkRepository
    }

    // MARK: Robots Service

    func getRobots(completion: @escaping RobotsResultBlock) {
        scheduler.doInBg { [weak self] in
            self?.networkRepository.getRobots { result in
                self?.handle(robotsNetworkResult: result, completion: completion)
            }
        }
    }

    private func handle(robotsNetworkResult result: Result<[Robot]>, completion: @escaping RobotsResultBlock) {
        handle(result: result, scheduler: scheduler, completion: completion)
    }
}
