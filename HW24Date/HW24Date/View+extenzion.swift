//
//  extansion.swift
//  HW24Date
//
//  Created by Вячеслав Башур on 01/09/2024.
//

import Foundation
import UIKit

extension UIView {
    func whiteShadowView() {
        layer.shadowOffset = CGSize(width: -6, height: -6)
        layer.shadowOpacity = 1
        layer.shadowColor = UIColor.white.cgColor
        layer.shadowRadius = 6
    }
    
    func blackShadowView() {
        layer.shadowOffset = CGSize(width: 18, height: 18)
        layer.shadowOpacity = 0.3
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 18
    }
    
    func setupView() {
        layer.cornerRadius = 24
        clipsToBounds = true
        backgroundColor = .systemGray5
    }
}
