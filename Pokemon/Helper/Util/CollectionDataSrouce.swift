//
//  CollectionDataSrouce.swift
//  Pokemon
//
//  Created by Gop-c2s2-f on 09/04/23.
//
import UIKit

typealias DiffableDataSource = UICollectionViewDiffableDataSource
typealias Snapshot = NSDiffableDataSourceSnapshot

extension UICollectionView {

    typealias SearchDataSource = DiffableDataSource<PokemonView.Section, PokemonView.Item>

    /// A diffable data source object with a `PokemonCell` cell and a `SpinnerFooterView` footer view.
    /// Used in the collection view in the `PokemonView`.
    /// - parameters:
    ///     - data: The given pokemon array
    ///     - delegate: The collection view delegate
    /// - returns: A diffable data source for the collection view
    func pokemonDataSource(data: [PokemonDetails], delegate del: UICollectionViewDelegate) -> SearchDataSource {
        setCollectionViewLayout(.pokemonLayout, animated: false)
        registerFooterView(SpinnerFooterView.self)
        registerCell(PokemonCell.self)
        delegate = del

        let dataSource = SearchDataSource(collectionView: self) { collectionView, indexPath, pokemon in
            let cell = collectionView.dequeueCell(PokemonCell.self, at: indexPath)
            cell.titleLabel.text = pokemon.name.capitalized
            cell.indexLabel.text = ""
//            cell.indexLabel.text = "#\(pokemon.id)"

            ImageCache.default.loadImage(from: pokemon.sprite.url, item: pokemon) { fetchedPokemon, image in
                guard let currentPokemon = fetchedPokemon as? PokemonDetails, currentPokemon == pokemon else { return }
                cell.setupImage(image)
            }
            return cell
        }

        dataSource.supplementaryViewProvider = { _, _, indexPath in
            self.dequeueFooterView(SpinnerFooterView.self, at: indexPath)
        }

        var snapshot = Snapshot<PokemonView.Section, PokemonView.Item>()
        snapshot.appendSections(["main"])
        snapshot.appendItems(data)
        dataSource.apply(snapshot)
        return dataSource
    }
}
