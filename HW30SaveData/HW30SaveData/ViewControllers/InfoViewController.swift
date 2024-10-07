//
//  InfoViewController.swift
//  HW30SaveData
//
//  Created by Вячеслав Башур on 07/10/2024.
//

import UIKit

class InfoViewController: UIViewController {

    private let manager = ViewManager.shared
    
    let action: (String) -> Void
    
    init(action: @escaping (String) -> Void) {
        self.action = action
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var saveButton = AppButton(actionButton: { self.actionSaveButton() }, style: .save)
    private lazy var backButton = AppButton(actionButton: { self.actionBackButton() }, style: .back)
    
    private lazy var titleLabel = AppLabel(style: .pageTitle)
    private lazy var subtitleLabel = AppLabel(style: .subtitle)
    
    private lazy var textField = {
        let field = UITextField()
        field.borderStyle = .roundedRect
        field.placeholder = "Введите имя"
        return field
    }()
    
    private lazy var stack = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.spacing = Constant.spacing
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setStack()
    }
    
    private func setStack() {
        titleLabel.text = "Информация"
        subtitleLabel.text = "Приведствую, я загадал число от 0 до 100, попробуй его угадать, введи число ниже и следи за подскасками, ты справишься. Чтобы начать введи свое имя"
        
        let buttonStack = manager.createHorizontStack(views: [backButton, saveButton])
        
        stack.addArrangedSubview(titleLabel)
        stack.addArrangedSubview(subtitleLabel)
        stack.addArrangedSubview(textField)
        stack.addArrangedSubview(buttonStack)
        view.addSubview(stack)
        NSLayoutConstraint.activate([
            stack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constant.indent),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constant.indent)
        ])
    }
    
    private func actionSaveButton() {
        guard let name = textField.text else { return }
        action(name)
        self.dismiss(animated: true)
    }
    
    private func actionBackButton() {
        self.dismiss(animated: true)
    }
    
}
