//
//  PokemonListBuilder.swift
//  Pokemon
//
//  Created by Gop-c2s2-f on 08/04/23.
//

import UIKit

/// A builder object used for building the `PokemonView` with all its' dependencies
final class PokemonViewBuilder {
    /// Build a `PokemonController` wrapped in a `NavigationController`
    /// - returns: A new navigation controller with the pokemon view controller as root controller
    static func build() -> NavigationController {
        let router = PokemonRouter()
        let interactor = PokemonInteractor(router: router, service: .default)
        let viewController = PokemonController(viewModel: .init(), interactor: interactor)
        let navigationController = NavigationController(rootViewController: viewController)
        navigationController.setNavbarApp(color: .pokeRed)
        interactor.view = viewController
        router.navigationController = navigationController
        return navigationController
    }
}
