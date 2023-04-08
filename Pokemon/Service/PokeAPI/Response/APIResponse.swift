//
//  APIResponse.swift
//  Pokemon
//
//  Created by Gop-c2s2-f on 09/04/23.
//

import Networking

struct APIResponse: Decodable {
    let next: String
    let results: [APIItem]
}

struct APIItem: Decodable {
    let name: String
    let url: String
}

extension Network.Service {
    static var `default`: Network.Service {
        Network.Service(server: ServerConfig(baseURL: "https://pokeapi.co/api/v2/"))
    }
}
