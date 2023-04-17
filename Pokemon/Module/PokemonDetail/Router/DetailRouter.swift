//
//  DetailRouter.swift
//  Pokemon
//
//  Created by Gop-c2s2-f on 11/04/23.
//

import UIKit

/// A protocol for the detail router implementation
protocol DetailRoutable: Routable {
    /// Route to the detail view with the given pokemon details
    /// - parameter container: A detail container object with all the selection information
    func showDialog(message: String?)
}

/// The `PokemonRouter` implementation
final class DetailRouter: DetailRoutable {
    
    // MARK: Public properties
    weak var navigationController: UINavigationController?

    // MARK: - Public functions
    func showDialog(message: String?) {
        navigationController?.showBasicAlert(
            title: message != nil ? "Captured!" : "Failed",
            message: message != nil ? message : "You failed catch this pokemon, Try again!" ,
            completion: {})
    }
}
