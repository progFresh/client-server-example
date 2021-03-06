//
//  GreenTextButton.swift
//  Robots
//
//  Created by Сергей Полозов on 25.09.17.
//  Copyright © 2017 sergey. All rights reserved.
//

import UIKit

@IBDesignable
final class GreenTextButton: ColoredTextButton {
    override var normalBackgroundColor: UIColor { return Color.errorButton}
    override var normalTitleColor: UIColor { return Color.white }
    override var normalBorderColor: UIColor { return Color.errorButton }

    override var highlightedBackgroundColor: UIColor { return Color.clear }
    override var highlightedTitleColor: UIColor { return Color.errorButton }
    override var highlightedBorderColor: UIColor { return Color.errorButton }
}
