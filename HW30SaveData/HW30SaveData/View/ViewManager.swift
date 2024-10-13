//
//  ViewManager.swift
//  HW30SaveData
//
//  Created by Вячеслав Башур on 30/09/2024.
//

import UIKit

class ViewManager {
    static let shared = ViewManager()
    init(){ }
   
    func createHorizontStack(views: [UIView]) -> UIStackView {
        let stack = UIStackView(arrangedSubviews: views)
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        stack.spacing = Constant.spacing
        return stack
    }
}
