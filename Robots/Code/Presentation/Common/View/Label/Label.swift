//
//  Label.swift
//  Robots
//
//  Created by Сергей Полозов on 25.09.17.
//  Copyright © 2017 sergey. All rights reserved.
//

import UIKit

@IBDesignable
class Label: UILabel {

    // MARK: Properties

    var labelFont: UIFont {
        return .systemFont(ofSize: UIFont.systemFontSize)
    }

    var labelColor: UIColor {
        return .black
    }

    // MARK: Initialization and deinitialization

    override init(frame: CGRect) {
        super.init(frame: frame)
        applyStyle()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        applyStyle()
    }

    // MARK: NSObject UIKit Additions

    override func prepareForInterfaceBuilder() {
        applyStyle()
    }

    // MARK: Internal Helpers

    func applyStyle() {
        font = labelFont
        textColor = labelColor
    }
}
