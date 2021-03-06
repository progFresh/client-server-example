//
//  RobotsRepository.swift
//  Robots
//
//  Created by Сергей Полозов on 26.09.17.
//  Copyright © 2017 sergey. All rights reserved.
//

import Foundation

protocol RobotsRepository {
    
    func getRobots(completion: @escaping RobotsResultBlock)
}
