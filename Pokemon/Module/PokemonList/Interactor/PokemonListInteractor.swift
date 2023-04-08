//
//  PokemonListInteractor.swift
//  Pokemon
//
//  Created by Gop-c2s2-f on 08/04/23.
//

import UIKit
import Combine
import Networking

/// A protocol for the pokemon interactor implementation
protocol PokemonInteractable {
    /// Download pokemon from the backend
    func loadPokemon()
}

/// The `PokemonInteractor` implementation
final class PokemonInteractor: PokemonInteractable {

    private var cancellables = Set<AnyCancellable>()
    private var apiResponse: APIResponse?
    private let service: Network.Service
    private let router: PokemonRoutable

    // MARK: - Public properties
    weak var view: PokemonViewProtocol? { didSet { setupInteractionPublisher() } }

    /// Init the `PokemonInteractor`
    /// - parameters:
    ///     - router: A router object used to navigate from the view
    ///     - service: A network service object used to make API calls
    init(router: PokemonRoutable, service: Network.Service) {
        self.router = router
        self.service = service
    }

    // MARK: - Public functions
    func loadPokemon() {
        try! service.request(createRequest(), logResponse: false)
            .handleEvents(receiveOutput: { response in
                self.apiResponse = response
            })
            .flatMap { response in
                Publishers.Sequence<[APIItem], Error>(sequence: response.results)
                    .tryCompactMap { [weak self] output -> AnyPublisher<PokemonDetails, Error>? in
                        guard let self = self else { return nil }
                        return try self.service.request(DetailRequest.details(output.url.asURL().lastPathComponent))
                    }
                    .flatMap { $0 }
                    .collect()
            }
            .sink { [weak self] result in
                self?.view?.viewModel.state = .idle
                switch result {
                case .success(let data):
                    self?.view?.viewModel.pokemon = data
                case .failure(let error):
                    print(error.localizedDescription)
                    print()
                }
            }
            .store(in: &cancellables)
    }

    private func createRequest() -> Requestable {
        guard let apiResponse = apiResponse else { return PokemonRequest.pokemon }

        let parameters = apiResponse.next.asURL().queryParameters()
        let offset = parameters[NextPokemonRequest.ParameterKey.offset.rawValue] ?? ""
        let limit = parameters[NextPokemonRequest.ParameterKey.limit.rawValue] ?? ""
        return NextPokemonRequest.next(offset: offset, limit: limit)
    }

    private func setupInteractionPublisher() {
        view?.interaction.sink { [weak self] interaction in
            switch interaction {
            case .selectPokemon(let container):
                self?.router.routeToDetailView(withPokemonContainer: container)
            case .scrollToBottom:
                if self?.view?.viewModel.state == .idle {
                    self?.loadPokemon()
                }
                self?.view?.viewModel.state = .loading
            }
        }.store(in: &cancellables)
    }
}