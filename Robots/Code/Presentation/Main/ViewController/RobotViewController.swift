//
//  RobotViewController.swift
//  Robots
//
//  Created by Сергей Полозов on 26.09.17.
//  Copyright © 2017 sergey. All rights reserved.
//

import UIKit

final class RobotViewController: ViewController {

    // MARK: IBOutlets

    @IBOutlet var rootView: RobotView!

    // MARK: Properties

    var robot: Robot?

    // MARK: UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        setupRootView()
        setupRobot()
    }

    // MARK: Private helpers

    private func setupRootView() {
        rootView.didLoad()
        rootView.errorButton.setTitle(.RobotBackButton, for: .normal)
        rootView.errorBlock = { [weak self ] in
            self?.navigationController?.popViewController(animated: true)
        }
    }

    private func setupRobot() {
        if let robot = self.robot {
            self.rootView.state = .items
            fillRobot(robot: robot)
        } else {
            rootView.state = .error
        }
    }

    private func fillRobot(robot: Robot) {
        title = robot.firstName
        rootView.imageView.layer.borderColor = Color.black.cgColor
        rootView.imageView.layer.borderWidth = CGFloat(1)
        rootView.imageView.setImage(withURL: robot.photo)
    }
}

