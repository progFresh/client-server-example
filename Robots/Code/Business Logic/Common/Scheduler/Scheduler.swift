//
//  Scheduler.swift
//  Robots
//
//  Created by Сергей Полозов on 26.09.17.
//  Copyright © 2017 sergey. All rights reserved.
//

import Foundation

protocol Scheduler {
    func doOnMainThread(_ block: @escaping Block)
    func doOnMainThread(after delay: TimeInterval, _ block: @escaping Block)
    func doInBg(_ block: @escaping Block)
    func doInBg(after delay: TimeInterval, _ block: @escaping Block)
}
