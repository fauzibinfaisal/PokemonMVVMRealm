//
//  MyMyPokemonListView.swift
//  MyPokemon
//
//  Created by Gop-c2s2-f on 09/04/23.
//

import UIKit
import Combine

/// The `MyPokemonView` implementation
final class MyPokemonView: UIView, ViewModable, Interactable, CollectionViewable {

    typealias Item = PokemonDetails
    typealias Section = String

    // MARK: Private properties
    private let subject: PassthroughSubject<Interaction, Never> = .init()
    private var cancellables = Set<AnyCancellable>()
    
    @IBOutlet weak var myPokemonCollectionView: UICollectionView!
    
    // MARK: - Public properties
    var interaction: AnyPublisher<Interaction, Never> { subject.eraseToAnyPublisher() }
    var viewModel: ViewModel! { didSet { setViewModel(viewModel) } }
    var collectionView: UICollectionView { myPokemonCollectionView }
    var dataSource: DiffableDataSource<Section, Item>!

    enum Interaction {
        case selectMyPokemon(PokemonContainer)
        case scrollToBottom
    }

    // MARK: - Public functions
    func setViewModel(_ viewModel: ViewModel) {
        dataSource = collectionView.pokemonDataSource(data: viewModel.pokemon, delegate: self)
//        collectionView.backgroundColor = .darkGrey

        viewModel.$pokemon.sink { [weak self] myPokemon in
            self?.appendData(myPokemon)
        }.store(in: &cancellables)
    }

    // MARK: - Private functions
    private func appendData(_ data: [PokemonDetails]) {
        var snapshot = dataSource.snapshot()
        var items = snapshot.itemIdentifiers
        items.append(contentsOf: data)
        items.sort(by: { $0.id < $1.id })
        snapshot.appendItems(items)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
}

extension MyPokemonView: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)

        guard let cell = collectionView.cell(at: indexPath) as? PokemonCell,
              let myPokemon = dataSource.itemIdentifier(for: indexPath)
        else { return }

        ImageCache.default.loadImage(from: myPokemon.sprite.url, item: myPokemon) { [weak self] _, image in
            let container = PokemonContainer(pokemon: myPokemon, cell: cell, image: image)
            self?.subject.send(.selectMyPokemon(container))
        }
    }
}

extension MyPokemonView {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard scrollView.hasScrolledToBottom else { return }
        subject.send(.scrollToBottom)
    }
}
