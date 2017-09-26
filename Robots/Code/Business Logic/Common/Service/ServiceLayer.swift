//
//  ServiceLayer.swift
//  Robots
//
//  Created by Сергей Полозов on 26.09.17.
//  Copyright © 2017 sergey. All rights reserved.
//


final class ServiceLayer {

    // MARK: Singleton

    static let shared = ServiceLayer()

    // MARK: Services

    let robotsService: RobotsService

    // MARK: Initialization

    private init() {
        self.robotsService = RobotsServiceAssemblyImpl().service()
    }
}
