//
//  PokemonListController.swift
//  Pokemon
//
//  Created by Gop-c2s2-f on 08/04/23.
//

import UIKit
import Combine

/// A protocol for the `PokemonController` implementation
protocol PokemonViewProtocol: AnyObject {
    var interaction: AnyPublisher<PokemonView.Interaction, Never> { get }
    var viewModel: PokemonView.ViewModel { get }
}

/// The `PokemonController` implementation
final class PokemonController: ViewController<PokemonView>, PokemonViewProtocol {

    private let interactor: PokemonInteractable

    // MARK: - Public properties
    override var preferredStatusBarStyle: UIStatusBarStyle { .lightContent }

    /// Init the `PokemonController`
    /// - parameters:
    ///     - viewModel: The given view model for the view
    ///     - interactor: The interactor object used to interact with the view
    init(viewModel: PokemonView.ViewModel, interactor: PokemonInteractable) {
        self.interactor = interactor
        super.init(viewModel: viewModel)
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        title = viewModel.title
        interactor.loadPokemon()
    }
}
