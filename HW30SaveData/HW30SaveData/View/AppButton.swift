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
        case info
        case save
        case back
        case remove
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
            self.backgroundColor = .green.withAlphaComponent(0.5)
        case .save:
            self.setTitle("Сохранить", for: .normal)
            self.backgroundColor = .green.withAlphaComponent(0.5)
        case .info:
            self.setTitle("Инфо", for: .normal)
            self.backgroundColor = .systemCyan.withAlphaComponent(0.5)
        case .back:
            self.setTitle("Назад", for: .normal)
            self.backgroundColor = .red.withAlphaComponent(0.5)
        case .remove:
            self.setImage(UIImage(systemName: "arrow.triangle.2.circlepath"), for: .normal)
            self.tintColor = .black
            self.backgroundColor = .red.withAlphaComponent(0.3)
        }
        self.addAction(.init(handler: { _ in self.actionButton() }), for: .touchUpInside)
        self.layer.cornerRadius = 5
        self.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
