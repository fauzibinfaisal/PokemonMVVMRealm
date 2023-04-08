//
//  MyMyPokemonListVM.swift
//  MyPokemon
//
//  Created by Gop-c2s2-f on 09/04/23.
//

import UIKit

extension MyPokemonView {
    /// A data structure for the pokemon view model
    final class ViewModel {
        @Published var pokemon = [PokemonDetails]()
        @Published var state: State = .idle

        enum State {
            case idle, loading
        }
    }
}

extension MyPokemonView.ViewModel {
    var title: String { "MyPokemon" }
}
