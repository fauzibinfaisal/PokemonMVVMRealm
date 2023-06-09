//
//  ViewController.swift
//  Pokemon
//
//  Created by Gop-c2s2-f on 09/04/23.
//

import UIKit
import Combine

/// A view controller subclass that takes a `UIView` with a xib and set up that view as its' root view.
/// The given view has to be subscribing to `ViewModable` and `Interactable`.
class ViewController<View>: UIViewController where View: ViewModable & Interactable {

    // MARK: Public properties
    var interaction: AnyPublisher<View.Interaction, Never> { nib.interaction }
    var viewModel: View.ViewModel { nib.viewModel }

    /// The nib for the view
    private(set) var nib: View

    /// Initialize the nib from the given view and initialize a new `ViewController`
    /// - parameter viewModel: The view model for the view
    init(viewModel: View.ViewModel) {
        self.nib = View.instanceFromNib()
        self.nib.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    // MARK: - Life cycle
    override func loadView() {
        view = nib
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backButtonTitle = ""
    }
}


extension ViewController {
    
    
    func showBasicAlert(title: String = "Warning", message: String? = nil, completion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel) { (_ ) in
            completion?()
        }
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}
