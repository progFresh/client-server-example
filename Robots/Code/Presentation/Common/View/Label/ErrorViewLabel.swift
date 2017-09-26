//
//  ErrorViewLabel.swift
//  Robots
//
//  Created by Сергей Полозов on 25.09.17.
//  Copyright © 2017 sergey. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
final class ErrorViewLabel: Label {
    override var labelColor: UIColor { return Color.errorViewLabel }
    override var labelFont: UIFont { return Font.errorView }
}
