//
//  addBookmarkViewController.swift
//  HW23WebKit
//
//  Created by Вячеслав Башур on 27/08/2024.
//

import UIKit

class AddBookmarkViewController: UIViewController {
   
    private var acceptAction: (String) -> Void
   
    init(
        acceptAction: @escaping (String) -> Void
    ){
        self.acceptAction = acceptAction
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    enum Constant {
        static let spacing: CGFloat = 5
        static let safe: CGFloat = 20
    }
    
    lazy var titleLable: UILabel = {
        let label = UILabel()
        label.text = "Закладка"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    lazy var cancelButton: UIButton = {
        let button = UIButton(type: .system, primaryAction: .init(handler: { _ in
            self.dismiss(animated: true)
        }))
        button.setTitle("Отмена", for: .normal)
        return button
    }()
    
    lazy var acceptButton: UIButton = {
        let button = UIButton(type: .system, primaryAction: .init(handler: { _ in
            self.acceptAction(self.textField.text ?? "")
        }))
        button.setTitle("Готово", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        return button
    }()
    
    lazy var textField: UITextField = {
        let field = UITextField()
        field.placeholder = "Введите имя закладки"
        field.borderStyle = .roundedRect
        return field
    }()
    
    lazy var wrapper: UIView = {
        let view = UIView()
        let blurEffect = UIBlurEffect(style: .extraLight)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(blurEffectView)
        return view
    }()
    
    lazy var buttonStack:UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
        cancelButton,
        titleLable,
        acceptButton
        ])
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = Constant.spacing
        return stack
    }()
    
    lazy var textFieldStack:UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
        buttonStack,
        textField
        ])
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = Constant.spacing
        return stack
    }()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(wrapper)
        wrapper.addSubview(textFieldStack)
        wrapper.translatesAutoresizingMaskIntoConstraints = false
        textFieldStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            wrapper.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            wrapper.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            wrapper.widthAnchor.constraint(equalToConstant: view.bounds.width),
            wrapper.heightAnchor.constraint(equalToConstant: view.bounds.height / 5),
            
            textFieldStack.topAnchor.constraint(equalTo: wrapper.topAnchor, constant: Constant.safe),
            textFieldStack.trailingAnchor.constraint(equalTo: wrapper.trailingAnchor, constant: -Constant.safe),
            textFieldStack.leadingAnchor.constraint(equalTo: wrapper.leadingAnchor, constant: Constant.safe),
            textFieldStack.bottomAnchor.constraint(equalTo: wrapper.bottomAnchor, constant: -Constant.safe),
        ])
    }

}
