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
    func login(login: String?, password: String?) -> Result<Void, AuthViewDelegateLoginError> {
        guard let login, !login.isEmpty else {
            return .failure(.emptyLogin)
        }
        
        guard let password, !password.isEmpty else {
            return .failure(.emptyPassword)
        }
        
        Task {
            let user = try await service.sighIn(email: login, password: password).get()
            guard user else { return }
            let vc = AppViewController()
//            vc.modalPresentationStyle = .overFullScreen
            present(vc, animated: true)
        }
        return .success(Void())
    }
    
    func register(login: String?, password: String?) -> Result<Void, AuthViewDelegateRegisterError> {
        guard let password, !password.isEmpty else {
            return .failure(.emptyPassword)
        }
        
        guard let login, !login.isEmpty else {
            return .failure(.emptyLogin)
        }
      
        Task {
//            тут лучше структутру юзера передавать
//            _ = await service.createUser(email: login, password: password)
            let user = try await service.createUser(email: login, password: password).get()
            print(user)
            }
       
        return .success(Void())
    }
}
