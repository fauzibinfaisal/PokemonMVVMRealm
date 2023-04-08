//
//  PokemonListRouter.swift
//  Pokemon
//
//  Created by Gop-c2s2-f on 08/04/23.
//

import UIKit

/// A protocol for the pokemon router implementation
protocol PokemonRoutable: Routable {
    /// Route to the detail view with the given pokemon details
    /// - parameter container: A pokemon container object with all the selection information
    func routeToDetailView(withPokemonContainer container: PokemonContainer)
}

/// The `PokemonRouter` implementation
final class PokemonRouter: PokemonRoutable {

    // MARK: Public properties
    weak var navigationController: UINavigationController?

    // MARK: - Public functions
    func routeToDetailView(withPokemonContainer container: PokemonContainer) {
        let detailView = DetailBuilder.build(fromContainer: container)
        navigationController?.present(detailView, animated: true)
    }
}
