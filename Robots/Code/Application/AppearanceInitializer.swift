//
//  AppearanceInitializer.swift
//  Robots
//
//  Created by Сергей Полозов on 26.09.17.
//  Copyright © 2017 sergey. All rights reserved.
//

import UIKit

protocol AppearanceInitializer {
    func initAppearance()
}

final class AppearanceInitializerImpl: AppearanceInitializer {

    // MARK: AppearanceInitializer

    func initAppearance() {
        initNavigationBarAppearance()
    }

    // MARK: Private Helpers

    private func initNavigationBarAppearance() {
        let appearance = UINavigationBar.appearance()
        appearance.isTranslucent = false
        appearance.barTintColor = UIColor.red
        appearance.tintColor = Color.white
        appearance.titleTextAttributes = [NSForegroundColorAttributeName: Color.white]
    }
}
