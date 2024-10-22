//
//  ViewService.swift
//  HW37Person2.0Localization
//
//  Created by Вячеслав Башур on 20/10/2024.
//

import Foundation
import UIKit

class ViewService {
    static let shared = ViewService()
    
    func horisontStack(subviews:[UIView]) -> UIStackView {
        let stack = UIStackView(arrangedSubviews: subviews)
        stack.axis = .horizontal
        stack.spacing = Constant.spacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }
    
    func verticalStack(subviews:[UIView]) -> UIStackView {
        let stack = UIStackView(arrangedSubviews: subviews)
        stack.spacing = Constant.spacing
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }
}
