//
//  CollectionViewAdapter.swift
//  Robots
//
//  Created by Сергей Полозов on 26.09.17.
//  Copyright © 2017 sergey. All rights reserved.
//

import UIKit

final class CollectionViewAdapter<Item, Cell: UICollectionViewCell>:
NSObject, UICollectionViewDataSource, UICollectionViewDelegate {

    // MARK: Properties

    var itemSelectedBlock: ((Int, Item) -> Void)?

    var configureCellBlock: ((Int, Item, Cell) -> Void)?

    // MARK: Private properties

    private let cellName = String(describing: Cell.self)

    private let items: [Item]
    
    // MARK: Initialization

    init(items: [Item], collectionView: UICollectionView) {
        self.items = items
        collectionView.register(UINib(nibName: cellName, bundle: nil), forCellWithReuseIdentifier: cellName)
    }

    // MARK: UICollectionViewDataSource

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
        ) -> UICollectionViewCell {
        let collectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellName, for: indexPath)
        guard let cell = collectionViewCell as? Cell else {
            fatalError("Invalid cell type")
        }
        configureCellBlock?(indexPath.row, items[indexPath.row], cell)
        return cell
    }

    // MARK: UICollectionViewDelegate

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        itemSelectedBlock?(indexPath.row, items[indexPath.row])
    }
}
