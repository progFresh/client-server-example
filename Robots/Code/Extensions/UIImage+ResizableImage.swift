//
//  UIImage+ResizableImage.swift
//  Robots
//
//  Created by Сергей Полозов on 25.09.17.
//  Copyright © 2017 sergey. All rights reserved.
//

import UIKit

extension UIImage {

    class func resizableImage(
        with borderColor: UIColor,
        cornerRadius: CGFloat,
        lineWidth: CGFloat,
        fillColor: UIColor
        ) -> UIImage? {
        let borderWidth = lineWidth + cornerRadius
        let size = borderWidth * CGFloat(2) + CGFloat(1)
        let rect = CGRect(x: 0, y: 0, width: size, height: size)

        UIGraphicsBeginImageContextWithOptions(rect.size, false, 4)
        let context = UIGraphicsGetCurrentContext()

        context?.setLineWidth(lineWidth)

        var path = UIBezierPath(
            roundedRect: rect.insetBy(dx: lineWidth, dy: lineWidth),
            cornerRadius: cornerRadius
            ).cgPath
        context?.addPath(path)
        context?.setFillColor(fillColor.cgColor)
        context?.fillPath()

        let insetModifier = lineWidth / 2
        path = UIBezierPath(
            roundedRect: rect.insetBy(dx: insetModifier, dy: insetModifier),
            cornerRadius: cornerRadius
            ).cgPath
        context?.addPath(path)
        context?.setStrokeColor(borderColor.cgColor)
        context?.strokePath()

        let image = UIGraphicsGetImageFromCurrentImageContext()

        UIGraphicsEndImageContext()

        let capInsets = UIEdgeInsets(top: borderWidth, left: borderWidth, bottom: borderWidth, right: borderWidth)

        return image?.resizableImage(withCapInsets: capInsets)
    }
}
