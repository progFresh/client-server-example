//
//  RobotCellLabel.swift
//  Robots
//
//  Created by Сергей Полозов on 26.09.17.
//  Copyright © 2017 sergey. All rights reserved.
//

import UIKit

@IBDesignable
final class RobotCellLabel: Label {
    override var labelColor: UIColor { return Color.robotCellLabel }
    override var labelFont: UIFont { return Font.robotCell }
}
