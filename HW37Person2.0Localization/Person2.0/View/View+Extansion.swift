//
//  View+Extansion.swift
//  HW37Person2.0Localization
//
//  Created by Вячеслав Башур on 03/11/2024.
//

import Foundation
import UIKit

extension UIView {
    func setLayerSettings() {
        layer.cornerRadius = 35
        layer.cornerCurve = .circular
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 1
        backgroundColor = .darkGray
        clipsToBounds = true
    }
}
