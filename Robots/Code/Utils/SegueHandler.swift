//
//  SegueHandler.swift
//  Robots
//
//  Created by Сергей Полозов on 26.09.17.
//  Copyright © 2017 sergey. All rights reserved.
//

import UIKit

protocol SegueHandler {
    associatedtype SegueIdentifier: RawRepresentable
}

extension SegueHandler where Self: UIViewController, SegueIdentifier.RawValue == String {
    func performSegue(with segueIdentifier: SegueIdentifier, sender: AnyObject?) {
        performSegue(withIdentifier: segueIdentifier.rawValue, sender: sender)
    }

    func segueIdentifier(for segue: UIStoryboardSegue) -> SegueIdentifier {
        guard let identifier = segue.identifier, let segueIdentifier = SegueIdentifier(rawValue: identifier) else {
            let segueId = segue.identifier ?? ""
            fatalError("Couldn't handle segue id \(segueId) for view controller of type \(type(of: self)).")
        }
        return segueIdentifier
    }
}
