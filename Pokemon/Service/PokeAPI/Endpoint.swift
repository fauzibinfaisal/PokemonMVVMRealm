//
//  Endpoint.swift
//  Pokemon
//
//  Created by Gop-c2s2-f on 09/04/23.
//

import Networking

/// An enumeration for all the possible endpoints for the backend
enum Endpoint {
    case details(String)
    case pokemon
}
extension Endpoint: EndpointType {

    var path: String {
        switch self {
        case .details(let id): return "pokemon/\(id)"
        case .pokemon: return "pokemon"
        }
    }
}
