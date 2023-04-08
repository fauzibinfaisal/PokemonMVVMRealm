//
//  PokemonModel.swift
//  Pokemon
//
//  Created by Gop-c2s2-f on 09/04/23.
//

import Foundation

struct PokemonDetails: Decodable {
    let id: Int
    let name: String
    let weight: Int
    let height: Int
    let baseExperience: Int
    let sprite: Sprite
    let abilities: [Ability]
    let moves: [Move]
    let types: [Type]
    let stats: [Stat]

    private enum CodingKeys: String, CodingKey {
        case id, name, weight, height, abilities, moves, types, stats
        case baseExperience = "base_experience"
        case sprite = "sprites"
    }
}

extension PokemonDetails: Hashable {

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension PokemonDetails: Equatable {

    static func == (lhs: PokemonDetails, rhs: PokemonDetails) -> Bool {
        lhs.id == rhs.id
    }
}

struct Sprite: Decodable {
    let url: String

    private enum CodingKeys: String, CodingKey {
        case url = "front_default"
    }
}

struct Ability: Decodable {
    let ability: APIItem
}

struct Move: Decodable {
    let move: APIItem
}

struct Type: Decodable {
    let type: APIItem
}

struct Stat: Decodable {
    let baseStat: Int
    let stat: APIItem

    private enum CodingKeys: String, CodingKey {
        case stat
        case baseStat = "base_stat"
    }
}
