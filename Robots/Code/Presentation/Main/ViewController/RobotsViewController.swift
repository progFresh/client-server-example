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

    // MARK: Private Properties
    
    private var adapter: CollectionViewAdapter<Robot, RobotCell>?
    private var robotForSegue: Robot?

    // MARK: UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        initNavigationBar()
        setupRootView(width: view.bounds.width)
        loadRobots()
    }

    override func viewWillTransition(
        to size: CGSize,
        with coordinator: UIViewControllerTransitionCoordinator
        ) {
        let width = size.width
        rootView.setupLayout(width: width)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? RobotViewController {
           destination.robot = self.robotForSegue
        }
    }
    // MARK: Private helpers

    private func setupRootView(width: CGFloat) {
        rootView.didLoad()
        rootView.setupLayout(width: width)
        rootView.errorBlock = { [weak self] in
            self?.loadRobots()
        }
    }

    private func initNavigationBar() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        title = .RobotsTitle
    }

    private func setupAdapter(robots: [Robot]) {
        let adapter = initAdapter(robots: robots)
        rootView.collectionView.dataSource = adapter
        rootView.collectionView.delegate = adapter
        self.adapter = adapter
    }

    private func initAdapter(robots: [Robot]) -> CollectionViewAdapter<Robot, RobotCell> {
        let adapter = CollectionViewAdapter<Robot, RobotCell>(items: robots, collectionView: rootView.collectionView)
        adapter.configureCellBlock = { [weak self] index, robot, cell in
            self?.configure(cell: cell, with: robot, at: index)
        }
        adapter.itemSelectedBlock = { [weak self] index, robot in
            self?.robotForSegue = robot
            self?.performSegue(with: .showRobot, sender: nil)
        }
        return adapter
    }

    private func configure(cell: RobotCell, with robot: Robot, at index: Int) {
        cell.configure(with: robot)
    }

    private func loadRobots() {
        rootView.state = .loading
        serviceLayer.robotsService.getRobots { (result) in
            self.handle(robotsResult: result)
        }
    }

    private func handle(robotsResult result: RobotResult) {
        switch result {
        case .success(let robots):
            handle(robots: robots)
        case .failure(let error):
            handle(error: error)
        }
    }

    private func handle(robots: [Robot]) {
        rootView.state = .items
        setupAdapter(robots: robots)
    }

    // MARK: Error Handling

    private func handle(error: Error) {
        rootView.state = .error
    }

}

extension RobotsViewController: SegueHandler {
    enum SegueIdentifier: String {
        case showRobot
    }
}
