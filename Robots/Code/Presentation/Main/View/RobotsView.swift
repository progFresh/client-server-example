//
//  RobotsView.swift
//  Robots
//
//  Created by Сергей Полозов on 25.09.17.
//  Copyright © 2017 sergey. All rights reserved.
//

import UIKit

@IBDesignable
final class RobotsView: View {

    // MARK: IBOutlets

    // MARK: IBActions

    // Properties

    // MARK: Internal Helpers

    func didLoad() {
        localize()
    }

    // MARK: Private Helpers

    private func localize() {}

    // MARK: View State

    override func setInitialState() {
        spinner.stopAnimating()
        errorView.isHidden = true
    }

    override func setItemsState() {
        setInitialState()
    }

    override func setErrorState() {
        setInitialState()
        errorView.isHidden = false
    }

    override func setLoadingState() {
        setInitialState()
        spinner.startAnimating()
    }
}
