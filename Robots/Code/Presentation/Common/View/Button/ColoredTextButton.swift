//
//  ColoredTextButton.swift
//  Robots
//
//  Created by Сергей Полозов on 25.09.17.
//  Copyright © 2017 sergey. All rights reserved.
//

import UIKit

@IBDesignable
class ColoredTextButton: UIButton {

    // MARK: Constants

    let cornerRadius: CGFloat = CGFloat(4)
    let borderWidth: CGFloat = 1
    let buttonTitleEdgeInsets: UIEdgeInsets = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)

    // MARK: Properties

    var normalBackgroundColor: UIColor { return .black }
    var normalTitleColor: UIColor { return .black }
    var normalBorderColor: UIColor { return .black }

    var highlightedBackgroundColor: UIColor { return .white }
    var highlightedTitleColor: UIColor { return .white }
    var highlightedBorderColor: UIColor { return .white }

    var buttonFont: UIFont { return UIFont.systemFont(ofSize: UIFont.systemFontSize) }

    // MARK: Initialization and deinitialization

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        applyStyle()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        applyStyle()
    }

    // MARK: NSObject UIKit Additions

    override func prepareForInterfaceBuilder() {
        applyStyle()
    }

    // MARK: UIView

    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(
            width: size.width + titleEdgeInsets.left + titleEdgeInsets.right,
            height: size.height + titleEdgeInsets.top + titleEdgeInsets.bottom
        )
    }

    // MARK: Private Helpers

    private func applyStyle() {
        applyTitleStyle()
        applyImages()
    }

    private func applyTitleStyle() {
        titleLabel?.font = buttonFont
        titleEdgeInsets = buttonTitleEdgeInsets
        setTitleColor(normalTitleColor, for: UIControlState())
        setTitleColor(highlightedTitleColor, for: .highlighted)
    }

    private func applyImages() {
        let normalImage = UIImage.resizableImage(
            with: normalBorderColor,
            cornerRadius:cornerRadius,
            lineWidth:borderWidth,
            fillColor:normalBackgroundColor
        )
        let highlightedImage = UIImage.resizableImage(
            with: highlightedBorderColor,
            cornerRadius:cornerRadius,
            lineWidth:borderWidth,
            fillColor:highlightedBackgroundColor
        )
        setBackgroundImage(highlightedImage, for: .highlighted)
        setBackgroundImage(normalImage, for: UIControlState())
    }
}
