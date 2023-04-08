//
//  UINib.swift
//  Pokemon
//
//  Created by Gop-c2s2-f on 08/04/23.
//

import UIKit

extension UINib {
    /// Initialize a new `UINib` from a `UIView`
    /// - parameter view: The view type to instantiate the nib from
    convenience init(view: UIView.Type) {
        self.init(nibName: view.identifier, bundle: nil)
    }
}
