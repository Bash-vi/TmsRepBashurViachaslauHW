//
//  AuthView.swift
//  HW40Firebase
//
//  Created by Вячеслав Башур on 12/11/2024.
//

import Foundation
import UIKit

enum AuthViewDelegateLoginError: Error {
    case emptyLogin
    case emptyPassword
    case emptyLoginAndPassword
    case wrongLoginOrPassword
    
    var errorMessage: String {
        return switch self {
        case .emptyLogin: "Empty login"
        case .emptyLoginAndPassword: "Empty login and password"
        case .emptyPassword: "Empty password"
        case .wrongLoginOrPassword: "Wrong login or password"
        }
    }
}
enum AuthViewDelegateRegisterError: Error {
    case emptyLogin
    case emptyPassword
    case emptyLoginAndPassword
    case save
    
    var errorMessage: String {
        return switch self {
        case .emptyLogin: "Empty login"
        case .emptyLoginAndPassword: "Empty login and password"
        case .emptyPassword: "Empty password"
        case .save: "Something wrong with storage"
        }
    }
}

protocol AuthViewDelegate: AnyObject {
    func login(login: String?, password: String?) -> Result<Void, AuthViewDelegateLoginError>
    func register(login: String?, password: String?, user: User) -> Result<Void, AuthViewDelegateRegisterError>
    func presentRegisterView()
}

final class AuthView: UIView {
    // MARK: - Elements
    
    weak var delegate: AuthViewDelegate?
    
    lazy var fieldsStackView: UIStackView = .init()
    
    lazy var loginField: UITextField  = {
        let field = UITextField()
        field.placeholder = "Login"
        field.keyboardType = .emailAddress
        return field
     }()
   
    lazy var passwordField: UITextField = {
        let field = UITextField()
        field.placeholder = "Password"
        field.keyboardType = .numberPad
        field.isSecureTextEntry = true
        return field
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton(
            type: .system,
            primaryAction: UIAction(
                handler: { [weak self] _ in
                    self?.loginButtonDidTap()
                }
            )
       )
       button.setTitle("Login", for: .normal)
       return button
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton(
            type: .system,
            primaryAction: UIAction(
                handler: { [weak self] _ in
                    self?.registerButtonDidTap()
                }
            )
       )
       button.setTitle("Register", for: .normal)
       return button
    }()
    
    lazy var errorLabel: UILabel = .init()
    
    init() {
        super.init(frame: .zero)
        print("view is loaded")
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
        
    private func setupView() {
        backgroundColor = .white
        
        errorLabel.isHidden = false
        
        let buttons = UIStackView(arrangedSubviews: [loginButton, registerButton])
        buttons.distribution = .equalCentering
        buttons.spacing = 10
        
        fieldsStackView.alignment = .center
        fieldsStackView.axis = .vertical
        fieldsStackView.spacing = 10
        fieldsStackView.translatesAutoresizingMaskIntoConstraints = false
        fieldsStackView.addArrangedSubview(loginField)
        fieldsStackView.addArrangedSubview(passwordField)
        fieldsStackView.addArrangedSubview(errorLabel)
        fieldsStackView.addArrangedSubview(buttons)
        
        addSubview(fieldsStackView)
        
        NSLayoutConstraint.activate([
            fieldsStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            fieldsStackView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor),
            fieldsStackView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor)
        ])
    }
    
    
    // MARK: - Actions
    
    func loginButtonDidTap() {
        guard let result = delegate?.login(
            login: loginField.text,
            password: passwordField.text
        ) else { return }
        
        switch result {
        case .success:
            errorLabel.text = nil
            errorLabel.isHidden = true
        case let .failure(error):
            errorLabel.isHidden = false
            errorLabel.text = error.errorMessage
            break
        }
    }
    
    func registerButtonDidTap() {
        delegate?.presentRegisterView()
    }
}
