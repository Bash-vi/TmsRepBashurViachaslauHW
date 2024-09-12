//
//  TextFieldViewController.swift
//  HW12delegatsAndCollback
//
//  Created by Вячеслав Башур on 04/09/2024.
//

import UIKit

class TextFieldViewController: UIViewController {
    
    let titleText: String
    
    let replace: (String) -> Void?
    
    init(
        titleText: String,
        replace: @escaping (String) -> Void?
    ){
        self.titleText = titleText
        self.replace = replace
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var textField = {
        let field = UITextField()
        field.placeholder = titleText
        field.borderStyle = .roundedRect
        field.backgroundColor = .systemGray5
        field.textColor = .black
        return field
    }()
    
    lazy var tittleLabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .white
        label.textAlignment = .center
        label.text = titleText
        return label
    }()
    
    lazy var backButton = PersonButton(
        style: .back,
        action: .init(handler: { [weak self] _ in
            self?.dismiss(animated: true )
        }))
    
    lazy var replaceButton = PersonButton(
        style: .replace,
        action: .init(handler: { [weak self] _ in
            self?.replace(self?.textField.text ?? "")
        }))
    
    lazy var stack = {
        let stack = UIStackView(arrangedSubviews: [
            titleStack,
            textField
        ])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = Constant.beetwenViews
        return stack
    }()
    
    lazy var titleStack = {
        let stack = UIStackView(arrangedSubviews: [
            backButton,
            tittleLabel,
            replaceButton
        ])
        stack.axis = .horizontal
        stack.spacing = Constant.spacing
        return stack
    }()
    
    lazy var stackView = {
        let stack = UIView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.layerSetup()
        return stack
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(stackView)
        stackView.addSubview(stack)
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(
                equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Constant.left),
            stackView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: Constant.right),
            
            stack.topAnchor.constraint(
                equalTo: stackView.topAnchor,
                constant: Constant.stack),
            stack.trailingAnchor.constraint(
                equalTo: stackView.trailingAnchor,
                constant: Constant.minusStack),
            stack.leadingAnchor.constraint(
                equalTo: stackView.leadingAnchor,
                constant: Constant.stack),
            stack.bottomAnchor.constraint(
                equalTo: stackView.bottomAnchor,
                constant: Constant.minusStack),
        ])
        self.modalPresentationStyle = .overFullScreen
    }
}
