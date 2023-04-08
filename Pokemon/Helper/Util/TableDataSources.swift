//
//  TableDataSources.swift
//  Pokemon
//
//  Created by Gop-c2s2-f on 09/04/23.
//

import UIKit

extension UITableView {

    typealias DetailViewDataSource = UITableViewDiffableDataSource<DetailView.Section, DetailView.Item>

    /// A diffable data source object registered with `DetailCell` cells and `StatCell` cells. Used in the table view in the `DetailView`.
    /// - parameters:
    ///     - viewModel: The view model of the view
    ///     - delegate: The delegate for the table view
    /// - returns: A diffable data source for the table view
    func detailViewDataSource(viewModel: DetailView.ViewModel, delegate del: UITableViewDelegate) -> DetailViewDataSource {
        contentInset = .init(top: 50, left: 0, bottom: 0, right: 0)
        registerCell(DetailCell.self)
        registerCell(StatCell.self)
        delegate = del

        let dataSource = DetailViewDataSource(tableView: self) { tableView, indexPath, item in
            switch DetailView.Section(rawValue: indexPath.section) {
            case .stats:
                let cell = tableView.dequeueCell(for: StatCell.self)
                cell.configure(withStat: item as? StatItem)
                self.rowHeight = 60.0
                return cell
            case .details:
                let cell = tableView.dequeueCell(for: DetailCell.self)
                cell.configure(withItem: item as? DetailItem)
                self.rowHeight = UITableView.automaticDimension
                return cell
            default:
                fatalError("Cell can't be dequeued. Shouldn't happen")
            }
        }

        var snapshot = Snapshot<DetailView.Section, DetailView.Item>()
        snapshot.appendSections([.stats])
        snapshot.appendItems(viewModel.stats)
        snapshot.appendSections([.details])
        snapshot.appendItems([viewModel.abilities])
        snapshot.appendItems([viewModel.moves])
        dataSource.apply(snapshot, animatingDifferences: false)
        return dataSource
    }
}
