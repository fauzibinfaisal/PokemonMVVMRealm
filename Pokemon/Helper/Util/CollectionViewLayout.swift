//
//  CollectionViewLayout.swift
//  Pokemon
//
//  Created by Gop-c2s2-f on 09/04/23.
//

import UIKit

private typealias SupplementaryItem = NSCollectionLayoutBoundarySupplementaryItem
private typealias CompositionalLayout = UICollectionViewCompositionalLayout
private typealias EdgeInsets = NSDirectionalEdgeInsets
private typealias Section = NSCollectionLayoutSection
private typealias Group = NSCollectionLayoutGroup
private typealias Size = NSCollectionLayoutSize
private typealias Item = NSCollectionLayoutItem

typealias Layout = UICollectionViewLayout

extension Layout {
    /// The collection view layout for the `PokemonView`
    static var pokemonLayout: Layout {
        let itemSize = Size(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = Item(layoutSize: itemSize)
        let groupSize = Size(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(160.0))
        let group = Group.horizontal(layoutSize: groupSize, subitem: item, count: 2)
        let padding: CGFloat = 20.0
        let spacing = CGFloat(padding)
        group.interItemSpacing = .fixed(spacing)
        let section = Section(group: group)
        section.interGroupSpacing = spacing
        section.contentInsets = EdgeInsets(top: padding, leading: padding, bottom: 30.0, trailing: padding)
        let headerSize = Size(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(60.0))
        let sectionHeader = SupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.footer, alignment: .bottom)
        section.boundarySupplementaryItems = [sectionHeader]
        return CompositionalLayout(section: section)
    }
}
