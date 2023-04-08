//
//  StatItem.swift
//  Pokemon
//
//  Created by Gop-c2s2-f on 09/04/23.
//

import UIKit

struct StatItem {
    let id = UUID()
    let title: String
    let value: Int
    let color: UIColor
}

extension StatItem: Hashable {

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
