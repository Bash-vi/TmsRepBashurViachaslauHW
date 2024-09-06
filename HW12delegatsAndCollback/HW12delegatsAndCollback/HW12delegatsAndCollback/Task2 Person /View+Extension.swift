//
//  View+Extansion.swift
//  HW12delegatsAndCollback
//
//  Created by Вячеслав Башур on 04/09/2024.
//

import UIKit

extension UIView {
    
    func layerSetup() {
        layer.cornerRadius = 25
        layer.cornerCurve = .circular
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 1
        backgroundColor = .darkGray
        clipsToBounds = true
    }
}
