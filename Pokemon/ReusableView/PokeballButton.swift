//
//  PokeballButton.swift
//  Pokemon
//
//  Created by Gop-c2s2-f on 10/04/23.
//

import UIKit

class PokeballButton: UIButton {
    
    var captureHandler: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    private func setupButton() {
        setImage(UIImage(named: "pokeball"), for: .normal)
        addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
    
    @objc private func buttonPressed() {
        animateShake()
    }
    
    private func animateShake() {
        let shakeAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        shakeAnimation.duration = 0.1
        shakeAnimation.autoreverses = true
        shakeAnimation.repeatCount = 7
        shakeAnimation.fromValue = NSNumber(value: -0.2)
        shakeAnimation.toValue = NSNumber(value: 0.2)
        layer.add(shakeAnimation, forKey: "shake")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            self.captureHandler?()

        }
    }
}
