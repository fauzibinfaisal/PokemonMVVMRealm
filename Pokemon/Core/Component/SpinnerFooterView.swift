//
//  SpinnerFooterView.swift
//  Pokemon
//
//  Created by Gop-c2s2-f on 09/04/23.
//

import UIKit

final class SpinnerFooterView: UICollectionReusableView {

    // MARK: Private properties
    private lazy var spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(useAutolayout: true)
//        spinner.color = .white
        return spinner
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(spinner)
        spinner.pinToSuperview(with: .init(top: -30, left: 0, bottom: 0, right: 0))
        spinner.startAnimating()
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
