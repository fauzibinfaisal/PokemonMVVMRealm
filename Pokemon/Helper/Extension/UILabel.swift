//
//  UILabel.swift
//  Pokemon
//
//  Created by Gop-c2s2-f on 08/04/23.
//

import UIKit

extension UILabel {
    static var accessoryView: UILabel {
        let label = UILabel()
//        label.textColor = .white
        label.font = .systemFont(ofSize: 17)
        label.text = ">"
        label.sizeToFit()
        return label
    }
}
