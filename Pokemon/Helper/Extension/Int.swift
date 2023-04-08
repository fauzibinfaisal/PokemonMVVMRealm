//
//  Int.swift
//  Pokemon
//
//  Created by Gop-c2s2-f on 09/04/23.
//

import Foundation

extension Int {
    var meter: String { String(format: "%.1f m", Double(self) / 10.0) }
    var kilo: String { String(format: "%.1f kg", Double(self) / 10.0) }
}
