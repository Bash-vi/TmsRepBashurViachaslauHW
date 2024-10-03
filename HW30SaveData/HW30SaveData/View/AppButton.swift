//
//  AppButton.swift
//  HW30SaveData
//
//  Created by Вячеслав Башур on 03/10/2024.
//

import UIKit

class AppButton: UIButton {
    enum Style {
        case check
    }
    
    let actionButton: () -> Void
    
    init(
        actionButton: @escaping () -> Void,
        style: Style
    ){
        self.actionButton = actionButton
        super.init(frame: .zero)
        switch style {
        case .check:
            self.setTitle("Ввод", for: .normal)
            self.backgroundColor = .green.withAlphaComponent(0.6)
        }
        self.addAction(.init(handler: { _ in self.actionButton() }), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
