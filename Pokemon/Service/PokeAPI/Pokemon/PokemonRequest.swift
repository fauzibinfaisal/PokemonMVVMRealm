//
//  PokemonRequest.swift
//  Pokemon
//
//  Created by Gop-c2s2-f on 09/04/23.
//

import Networking

/// An enum for requesting the pokemon data
enum PokemonRequest: Requestable {
    case pokemon

    var endpoint: EndpointType { Endpoint.pokemon }
    var encoding: Request.Encoding { .query }
    var httpMethod: HTTP.Method { .get }
}
