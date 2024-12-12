//
//  RegisterViewController.swift
//  HW40Firebase
//
//  Created by Вячеслав Башур on 08/12/2024.
//

import UIKit

class RegisterViewController: UIViewController {
    let registerView = RegisterView()
    let service = AuthService()

    override func loadView() {
        view = registerView
    }
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        super.viewDidLoad()
        registerView.delegate = self
    }
}

extension RegisterViewController: AuthViewDelegate {
    func login(login: String?, password: String?) -> Result<Void, AuthViewDelegateLoginError> {
        return .success(Void())
    }
    
    func presentRegisterView() {
        let vc = RegisterViewController()
        present(vc, animated: true)
    }
    
    func register(login: String?, password: String?, user: User) -> Result<Void, AuthViewDelegateRegisterError> {
        guard let password, !password.isEmpty else {
            return .failure(.emptyPassword)
        }
        
        guard let login, !login.isEmpty else {
            return .failure(.emptyLogin)
        }
      
        Task {
//            тут лучше структутру юзера передавать
//            _ = await service.createUser(email: login, password: password)
            let user = try await service.createUser(email: login, password: password, user: user).get()
            print(user)
//             готовый юзер
            }
        dismiss(animated: true)
        return .success(Void())
    }
}
