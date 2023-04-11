//
//  DetailController.swift
//  Pokemon
//
//  Created by Gop-c2s2-f on 09/04/23.
//

import UIKit
import Combine

/// The `DetailController` implementation
final class DetailController: ViewController<DetailView> {

    // MARK: Private properties
    private lazy var closeButton: UIBarButtonItem = {
        let button = UIBarButtonItem(image: UIImage.init(systemName: "chevron.left"), style: .plain, target: self, action: #selector(close))
        let color: UIColor = viewModel.isLight ? .black : .white
        button.tintColor = color
        button.setTitleTextAttributes([.font: UIFont.systemFont(ofSize: 17), .foregroundColor: color], for: .normal)
        return button
    }()

    private lazy var idButton: UIBarButtonItem = {
        let button = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
//        let button = UIBarButtonItem(title: viewModel.id, style: .plain, target: nil, action: nil)
        let color: UIColor = viewModel.isLight ? .black : .white
        button.setTitleTextAttributes([.font: UIFont.systemFont(ofSize: 17), .foregroundColor: color], for: .normal)
        return button
    }()

    // MARK: - Public properties
    override var preferredStatusBarStyle: UIStatusBarStyle {
        guard let nav = navigationController else { fatalError("No navigation here, should never happen!") }
        return nav.isBeingDismissed ? .lightContent : viewModel.isLight ? .darkContent : .lightContent
    }

    // MARK: - Init
    /// Init the `DetailController`
    /// - parameter viewModel: The given view model for the view
    override init(viewModel: DetailView.ViewModel) {
        var vm = viewModel
        super.init(viewModel: vm)
        
        vm.pokeballTapped = {
            let captureSucceeded = arc4random_uniform(2) == 0
        
            if captureSucceeded {
                self.showBasicAlert(title: "Pokemon captured!", message: "You caught a wild pokemon!")

            } else {
                self.showBasicAlert(title: "Pokemon escaped!", message: "The wild pokemon broke free.")
            }
        }
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        //        view.backgroundColor = .darkGrey
        title = viewModel.title

        navigationItem.leftBarButtonItem = closeButton
        navigationItem.rightBarButtonItem = idButton
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavbarApp(color: .pokeRed)
    }

    // MARK: - Private functions
    @objc private func close() {
        dismiss(animated: true)
    }
}
