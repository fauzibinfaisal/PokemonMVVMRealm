//
//  DetailInteractor.swift
//  Pokemon
//
//  Created by Gop-c2s2-f on 11/04/23.
//

import Foundation

import UIKit
import Combine
import Networking

/// A protocol for the pokemon interactor implementation
protocol DetailInteractable {
    /// Download pokemon from the backend
    func loadMyPokemon(pokemon: PokemonDetails?)
    func tryCatchingPokemon(pokemon: PokemonDetails) -> String?
}

/// The `DetailInteractor` implementation
final class DetailInteractor: DetailInteractable {
    
    private var cancellables = Set<AnyCancellable>()
    private let router: DetailRoutable
    
    // MARK: - Public properties
    weak var view: DetailViewProtocol? { didSet { setupInteractionPublisher() } }
    
    /// Init the `PokemonInteractor`
    /// - parameters:
    ///     - router: A router object used to navigate from the view
    ///     - service: A network service object used to make API calls
    init(router: DetailRoutable) {
        self.router = router
    }
    
    private func setupInteractionPublisher() {
        view?.interaction.sink { [weak self] interaction in
            switch interaction {
            case .catchPokemen(let container):
                self?.router.showDialog(message: self?.tryCatchingPokemon(pokemon: container))
            }
        }.store(in: &cancellables)
    }
    
    // MARK: - Public functions
    func loadMyPokemon(pokemon: PokemonDetails?) {
        print("my pokemon : \(pokemon?.name ?? "-"))")
    }
    
    func tryCatchingPokemon (pokemon: PokemonDetails) -> String? {
        let captureSucceeded = arc4random_uniform(2) == 0
        if captureSucceeded {
            return "You caught \(pokemon.name)\nCongrats!"
        } else {
            return nil
        }
    }
}
