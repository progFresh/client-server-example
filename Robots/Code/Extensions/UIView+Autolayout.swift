//
//  UIView+Autolayout.swift
//  Robots
//
//  Created by Сергей Полозов on 25.09.17.
//  Copyright © 2017 sergey. All rights reserved.
//

import UIKit
import SnapKit

extension UIView {
    func add(subview: UIView, alignedTo edges: UIEdgeInsets) {
        addSubview(subview)
        subview.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalTo(self).inset(edges)
        }
    }

    func addCentered(subview: UIView) {
        addSubview(subview)
        subview.snp.makeConstraints { make in
            make.center.equalTo(self)
        }
    }
}
