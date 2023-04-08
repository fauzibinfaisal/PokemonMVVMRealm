//
//  TableViewable.swift
//  Pokemon
//
//  Created by Gop-c2s2-f on 09/04/23.
//

import UIKit

/// A protocol used in views to make them table viewable
protocol TableViewable where Self: UIView {
    /// The associated section type
    associatedtype Section: Hashable
    /// The associated item type
    associatedtype Item: Hashable

    /// The data source for the collection view
    var dataSource: UITableViewDiffableDataSource<Section, Item>! { get }
    /// The table view in the view
    var tableView: UITableView { get }
}
