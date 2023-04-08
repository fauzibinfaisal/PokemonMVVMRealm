//
//  PresentableView.swift
//  Pokemon
//
//  Created by Gop-c2s2-f on 09/04/23.
//

import UIKit

/// A protocol that makes a view controller presentable
protocol PresentableView: UIViewController {
    /// The transition delegate object for the presentable view
    var transitionManager: UIViewControllerTransitioningDelegate? { get }
    /// The final receiving frame of the custom transition
    var receivingFrame: CGRect? { get }
}
