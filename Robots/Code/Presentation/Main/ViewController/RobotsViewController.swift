//
//  RobotsViewController.swift
//  Robots
//
//  Created by Сергей Полозов on 25.09.17.
//  Copyright © 2017 sergey. All rights reserved.
//

import UIKit

class RobotsViewController: ViewController {

    // MARK: IBOutlets

    @IBOutlet var rootView: RobotsView!

    // MARK: UIViewCOntroller

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "title"
        setupRootView()
        self.performSegue(with: .showRobot, sender: nil)
    }

    // MARK: Private helpers

    private func setupRootView() {
        rootView.didLoad()
    }
}

extension RobotsViewController: SegueHandler {
    enum SegueIdentifier: String {
        case showRobot
    }
}
