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
        imageView.setImage(withURL: robot.photo)
    }
}
