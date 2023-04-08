//
//  UIScrollView.swift
//  Pokemon
//
//  Created by Gop-c2s2-f on 08/04/23.
//

import UIKit

extension UIScrollView {
    /// A boolean value that is true if the scroll view has scrolled to the bottom of the view
    var hasScrolledToBottom: Bool {
        contentSize.height - contentOffset.y < frame.size.height * 1.6
    }
}

