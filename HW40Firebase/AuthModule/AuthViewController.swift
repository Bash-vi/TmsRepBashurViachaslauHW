//
//  ViewController.swift
//  HW40Firebase
//
//  Created by Вячеслав Башур on 12/11/2024.
//

import UIKit
import FirebaseAuth

class AuthViewController: UIViewController {
    let authView = AuthView()
    
    let service = AuthService()
    
    var elementServise: ElementServiceLogic?

    override func loadView() {
        view = authView
    }
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        super.viewDidLoad()
        authView.delegate = self
    }
}

extension AuthViewController: AuthViewDelegate {
    func presentRegisterView() {
        let vc = RegisterViewController()
        present(vc, animated: true)
    }
    
    func login(login: String?, password: String?) -> Result<Void, AuthViewDelegateLoginError> {
        guard let login, !login.isEmpty else {
            return .failure(.emptyLogin)
        }
        
        guard let password, !password.isEmpty else {
            return .failure(.emptyPassword)
        }
        
        Task {
            let user = try await service.sighIn(email: login, password: password).get()
//            let userData = await service.getUserData()
            let elements = await elementServise?.readElements()
            Task { @MainActor in
                let vc = AppViewController()
                vc.user = user
                vc.list = elements ?? []
                vc.modalPresentationStyle = .overFullScreen
                present(vc, animated: true)
            }
            
        }
        return .success(Void())
    }
    
    func register(login: String?, password: String?, user: User) -> Result<Void, AuthViewDelegateRegisterError> {
        return .success(Void())
    }
}
