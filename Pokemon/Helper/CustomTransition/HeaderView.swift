//
//  HeaderView.swift
//  Pokemon
//
//  Created by Gop-c2s2-f on 09/04/23.
//

import UIKit

extension Transition.Animator {
    /// A header view used in the custom interactive transition
    final class Header: UIView {
        /// Init the HeaderView
        /// - parameters:
        ///     - frame: The given frame for the view
        ///     - image: An optional image
        ///     - cornerRadius: A float value for the corner radius of the header
        init(frame: CGRect, image: UIImage?, cornerRadius: CGFloat) {
            super.init(frame: frame)
            layer.cornerRadius = cornerRadius
            backgroundColor = image?.dominantColor
            alpha = 0.0
        }

        required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    }
}
