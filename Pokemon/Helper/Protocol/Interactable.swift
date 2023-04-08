//
//  Interactable.swift
//  Pokemon
//
//  Created by Gop-c2s2-f on 09/04/23.
//

import Combine

/// A protocol for making views interactable
protocol Interactable {
    /// The associated interaction type. Often an enum with interactions in a view.
    associatedtype Interaction
    /// The interaction publisher that communicates the interactions.
    var interaction: AnyPublisher<Interaction, Never> { get }
}
