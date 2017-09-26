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

    @IBOutlet weak var collectionView: UICollectionView!

    // MARK: IBActions

    // Properties

    private let layout = UICollectionViewFlowLayout()
    private let paddingSmall: CGFloat = 8
    private let robotAspect: CGFloat = 2 / 3

    // MARK: Internal Helpers

    func didLoad() {
        localize()
        initColletionView()
    }

    func setupLayout(width: CGFloat) {
        let padding = paddingSmall
        let robotColumns: CGFloat = 2
        let allItemsWidth = width - padding * (robotColumns + 1)
        let itemWidth = allItemsWidth / robotColumns
        layout.sectionInset = UIEdgeInsets(top: 0, left: padding, bottom: padding, right: padding)
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth / robotAspect)
        layout.minimumInteritemSpacing = padding
        layout.minimumLineSpacing = padding
    }

    // MARK: Private Helpers

    private func localize() {}

    private func initColletionView() {
        collectionView.collectionViewLayout = layout
    }

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
