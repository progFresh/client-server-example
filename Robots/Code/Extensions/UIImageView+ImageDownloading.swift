//
//  UIImageView+ImageDownloading.swift
//  Robots
//
//  Created by Сергей Полозов on 26.09.17.
//  Copyright © 2017 sergey. All rights reserved.
//

import UIKit
import AlamofireImage

extension UIImageView {
    func setImage(withURL urlString: String) {
        guard let url = URL(string: urlString) else {
            return
        }
        af_setImage(withURL: url)
    }
}
