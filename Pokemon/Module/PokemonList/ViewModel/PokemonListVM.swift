//
//  PokemonListVM.swift
//  Pokemon
//
//  Created by Gop-c2s2-f on 08/04/23.
//

import UIKit

extension PokemonView {
    /// A data structure for the pokemon view model
    final class ViewModel {
        @Published var pokemon = [PokemonDetails]()
        @Published var state: State = .idle

        enum State {
            case idle, loading
        }
    }
}

extension PokemonView.ViewModel {
    var title: String { "Pokemon" }
}
