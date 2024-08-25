//
//  CustomView.swift
//  HW22UIAlertAndUIPicker
//
//  Created by Вячеслав Башур on 25/08/2024.
//

import UIKit

class CustomView: UIView {
    lazy var stack = UIStackView()
    lazy var button = UIButton(type: .system)
    enum conf {
        static let const: CGFloat = 15
        static let corRad: CGFloat = 30
        static let borWidth: CGFloat = 2
    }
    var actionButton: () -> Void
    init(
        someView: UIView,
        titleButton: String,
        actionButton: @escaping () -> Void
    ){
        self.actionButton = actionButton
        super.init(frame: .zero)
        
        self.stack.addArrangedSubview(someView)
        self.button.setTitle(titleButton, for: .normal)
        self.button.addAction(.init(handler: { _ in
            self.actionButton()
        }), for: .touchUpInside)
        setupView()
        
    }
    private func setupView() {
        self.addSubview(stack)
        stack.addArrangedSubview(button)
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = conf.const
        stack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: self.topAnchor, constant: conf.const),
            stack.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -conf.const),
            stack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: conf.const),
            stack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -conf.const)
        ])
        self.layer.cornerRadius = conf.corRad
        self.layer.borderWidth = conf.borWidth
        self.layer.borderColor = UIColor.black.cgColor
        button.backgroundColor = .systemBlue.withAlphaComponent(0.1)
        button.layer.cornerRadius = conf.corRad
        button.layer.borderWidth = conf.borWidth
        button.layer.borderColor = UIColor.black.cgColor
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.textAlignment = .center
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
