//
//  Routable.swift
//  Pokemon
//
//  Created by Gop-c2s2-f on 09/04/23.
//

import UIKit

/// A protocol for creating routable objects
@objc protocol Routable: AnyObject {
    /// An optional weak navigation controller used for navigating in the router
    weak var navigationController: UINavigationController? { get }
}
