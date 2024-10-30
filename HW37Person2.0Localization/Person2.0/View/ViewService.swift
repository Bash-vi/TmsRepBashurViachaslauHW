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
    
    func createPageTitle(title: String, closeAction: UIAction, saveAction: UIAction) -> UIStackView {
        let pageTitle = PersonLabel(style: .pageTitle)
        pageTitle.text = title
        let closeButton = PersonButton(style: .close, action: closeAction)
        let saveButton = PersonButton(style: .save, action: saveAction)
        let stack = horisontStack(subviews: [closeButton ,pageTitle, saveButton])
        return stack
    }
    
    func createHobbiesPageTitle(title: String, closeAction: UIAction, addAction: UIAction) -> UIStackView {
        let pageTitle = PersonLabel(style: .pageTitle)
        pageTitle.text = title
        let closeButton = PersonButton(style: .close, action: closeAction)
        let saveButton = PersonButton(style: .add, action: addAction)
        let stack = horisontStack(subviews: [closeButton ,pageTitle, saveButton])
        return stack
    }
}
