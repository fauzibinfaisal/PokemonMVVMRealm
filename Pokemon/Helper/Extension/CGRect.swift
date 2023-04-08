//
//  CGRect.swift
//  Pokemon
//
//  Created by Gop-c2s2-f on 08/04/23.
//

import Foundation

extension CGRect {
    /// Inset the current frame with a edge inset
    /// - returns: The new insetted rect
    func imageInset() -> CGRect {
        inset(by: .init(top: 0, left: 10, bottom: 15, right: 10))
    }
}
