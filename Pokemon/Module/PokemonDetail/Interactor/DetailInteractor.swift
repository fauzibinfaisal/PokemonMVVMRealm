//
//  DetailInteractor.swift
//  Pokemon
//
//  Created by Gop-c2s2-f on 11/04/23.
//

import Foundation

import UIKit
/// A protocol for the pokemon interactor implementation
protocol DetailInteractable {
    /// Download pokemon from the backend
    func loadMyPokemon()
}

/// The `PokemonInteractor` implementation
final class DetailInteractor: DetailInteractable {
    func loadMyPokemon() {
        print("load")
    }
    



}
