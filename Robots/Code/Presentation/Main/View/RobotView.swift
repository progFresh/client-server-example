//
//  RobotView.swift
//  Robots
//
//  Created by Сергей Полозов on 26.09.17.
//  Copyright © 2017 sergey. All rights reserved.
//

import UIKit

@IBDesignable
final class RobotView: View {

    // MARK: IBOutlets

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!

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
        scrollView.isHidden = true
    }

    override func setItemsState() {
        setInitialState()
        scrollView.isHidden = false
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
