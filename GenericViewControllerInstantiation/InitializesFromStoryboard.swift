//
//  ViewControllerInitializer.swift
//  ViewControllerContainment
//
//  Created by Nathan Hsu on 2019-02-16.
//  Copyright © 2019 Nathan Hsu. All rights reserved.
//

import UIKit

protocol InitializesFromStoryboard {
    static func instantiateFromStoryboardWithIdenticalNameAndIdentifier<T>() -> T
}

extension UIViewController: InitializesFromStoryboard {
    static func instantiateFromStoryboardWithIdenticalNameAndIdentifier<T>() -> T {
        let storyboard = UIStoryboard.init(name: String(describing: T.self), bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: String(describing: T.self))
        return viewController as! T
    }
    static func instantiate<T>(from storyboard: UIStoryboard, identifier: String) -> T {
        return storyboard.instantiateViewController(withIdentifier: identifier) as! T
    }
}
