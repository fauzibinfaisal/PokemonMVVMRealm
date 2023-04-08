//
//  UIString.swift
//  Pokemon
//
//  Created by Gop-c2s2-f on 09/04/23.
//

import UIKit

extension String {

    var cleaned: String {
        let e = replacingOccurrences(of: "é", with: "e")
        let dash = e.replacingOccurrences(of: "-", with: " ").capitalized
        return dash
    }

    func lineHeight(_ height: CGFloat) -> NSAttributedString? {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = height
        let attributedString = NSMutableAttributedString(string: self)
        attributedString.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedString.length))
        return attributedString
    }

    func foundMatch(for string: String) -> Bool {
        (cleaned as NSString).range(of: string, options: .caseInsensitive).location != NSNotFound
    }

    static func types(from types: [Type]) -> String {
        types.compactMap { $0.type.name.cleaned }.joined(separator: "\n")
    }
}
