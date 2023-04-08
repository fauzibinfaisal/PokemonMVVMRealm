//
//  TabBarController.swift
//  Pokemon
//
//  Created by Gop-c2s2-f on 08/04/23.
//

import Foundation

import UIKit

final class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabbar()
    }

    private func setupTabbar() {
        let pokemonView = PokemonViewBuilder.build()
        pokemonView.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house.fill"), tag: 0)

        let myPokemonView = MyPokemonViewBuilder.build()
        myPokemonView.tabBarItem = UITabBarItem(title: "My Pokemon", image: UIImage(systemName: "cricket.ball.fill"), tag: 1)
        setViewControllers([pokemonView, myPokemonView], animated: false)
    }
}
