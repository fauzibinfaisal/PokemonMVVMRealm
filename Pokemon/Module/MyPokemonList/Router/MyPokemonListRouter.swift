//
//  MyMyPokemonListRouter.swift
//  MyPokemon
//
//  Created by Gop-c2s2-f on 09/04/23.
//

import UIKit

/// A protocol for the pokemon router implementation
protocol MyPokemonRoutable: Routable {
    /// Route to the detail view with the given pokemon details
    /// - parameter container: A pokemon container object with all the selection information
    func routeToDetailView(withMyPokemonContainer container: PokemonContainer)
}

/// The `MyPokemonRouter` implementation
final class MyPokemonRouter: MyPokemonRoutable {

    // MARK: Public properties
    weak var navigationController: UINavigationController?

    // MARK: - Public functions
    func routeToDetailView(withMyPokemonContainer container: PokemonContainer) {
        let detailView = DetailBuilder.build(fromContainer: container)
        navigationController?.present(detailView, animated: true)
    }
}
