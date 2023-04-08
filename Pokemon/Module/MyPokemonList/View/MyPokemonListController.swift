//
//  MyMyPokemonListController.swift
//  MyPokemon
//
//  Created by Gop-c2s2-f on 09/04/23.
//

import UIKit
import Combine

/// A protocol for the `MyPokemonController` implementation
protocol MyPokemonViewProtocol: AnyObject {
    var interaction: AnyPublisher<MyPokemonView.Interaction, Never> { get }
    var viewModel: MyPokemonView.ViewModel { get }
}

/// The `MyPokemonController` implementation
final class MyPokemonController: ViewController<MyPokemonView>, MyPokemonViewProtocol {

    // MARK: Private properties
    private let interactor: MyPokemonInteractable

    // MARK: - Public properties
    override var preferredStatusBarStyle: UIStatusBarStyle { .lightContent }

    // MARK: - Init
    /// Init the `MyPokemonController`
    /// - parameters:
    ///     - viewModel: The given view model for the view
    ///     - interactor: The interactor object used to interact with the view
    init(viewModel: MyPokemonView.ViewModel, interactor: MyPokemonInteractable) {
        self.interactor = interactor
        super.init(viewModel: viewModel)
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        title = viewModel.title
        interactor.loadMyPokemon()
    }
}
