//
//  RobotsServiceAssembly.swift
//  Robots
//
//  Created by Сергей Полозов on 26.09.17.
//  Copyright © 2017 sergey. All rights reserved.
//

import Foundation

protocol RobotsServiceAssembly {
    func service() -> RobotsService
}

final class RobotsServiceAssemblyImpl: ServiceAssembly, RobotsServiceAssembly {
    func service() -> RobotsService {
        return RobotsServiceImpl(
            scheduler: scheduler(),
            networkRepository: networkRepository()
        )
    }

    private func networkRepository() -> RobotsRepository {
        return RobotsNetworkRepository(
            transport: transport(),
            deserializer: deserializer()
        )
    }
}
