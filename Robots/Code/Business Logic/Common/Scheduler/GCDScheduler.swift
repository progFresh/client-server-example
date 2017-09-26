//
//  GCDScheduler.swift
//  Robots
//
//  Created by Сергей Полозов on 26.09.17.
//  Copyright © 2017 sergey. All rights reserved.
//

import Foundation

final class GCDScheduler: Scheduler {

    func doOnMainThread(_ block: @escaping Block) {
        doOnMainThread(after: 0, block)
    }

    func doInBg(_ block: @escaping Block) {
        doInBg(after: 0, block)
    }

    func doOnMainThread(after delay: TimeInterval, _ block: @escaping Block) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: block)
    }

    func doInBg(after delay: TimeInterval, _ block: @escaping Block) {
        DispatchQueue.global(qos: .default).asyncAfter(deadline: .now() + delay, execute: block)
    }
}
