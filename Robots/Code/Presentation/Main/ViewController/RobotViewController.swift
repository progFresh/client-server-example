//
//  RobotViewController.swift
//  Robots
//
//  Created by Сергей Полозов on 26.09.17.
//  Copyright © 2017 sergey. All rights reserved.
//

import UIKit

final class RobotViewController: ViewController {

    // MARK: Properties

    var robot: Robot?

    // MARK: UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        print(robot)
    }
}

