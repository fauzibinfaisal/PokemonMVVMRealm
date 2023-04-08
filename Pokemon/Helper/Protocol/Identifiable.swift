//
//  Identifiable.swift
//  Pokemon
//
//  Created by Gop-c2s2-f on 09/04/23.
//

import Foundation

/// A protocol that makes its' subscribers identifiable
protocol Identifiable {
    /// A static string that identifies the object
    static var identifier: String { get }
}
extension Identifiable {
    static var identifier: String { String(describing: self) }
}
