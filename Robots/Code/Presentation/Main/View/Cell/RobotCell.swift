//
//  RobotCell.swift
//  Robots
//
//  Created by Сергей Полозов on 26.09.17.
//  Copyright © 2017 sergey. All rights reserved.
//

import UIKit

class RobotCell: UICollectionViewCell {
    
    // MARK: IBOutlets

    @IBOutlet weak var imageView: UIImageView!

    // MARK: Private helpers

    func configure(with robot: Robot) {
        imageView.layer.borderColor = Color.black.cgColor
        imageView.layer.borderWidth = CGFloat(1)
        imageView.setImage(withURL: robot.photo)
    }
}
