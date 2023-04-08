//
//  DetailItem.swift
//  Pokemon
//
//  Created by Gop-c2s2-f on 09/04/23.
//

import Foundation

struct DetailItem {
    let id = UUID()
    let title: String
    let value: String
}

extension DetailItem: Hashable {

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
