//
//  Account.swift
//  HW49UnitTests
//
//  Created by Вячеслав Башур on 13/12/2024.
//

import Foundation

class Account {
    typealias Login = String
    typealias Password = String
    
    private let maxUsernameLength = 8
    private let minimumPasswordLength = 8
    
    private var users: [Login: Password]
    
    init(
        users: [String: String]
    ) {
        self.users = users
    }
    
    enum loginError: Error {
        case wrongPassword
        case toLongUsername
        case toShortPassword
        case loginIsEmpty
        case passwordIsEmpty
    }
    
    enum RegisterError: Error {
        case userExist
        case whitespaces
        case toLongUsername
        case toShortPassword
    }
    
    func login(login: String, password: String) -> Result<Bool, loginError> {
        if let error = validateLogin(login: login, password: password) {
            return .failure(error)
        }
        
        users[login] = password
            return .success(true)
    }
    
    private func validateLogin(login: Login, password: Password) -> loginError? {
        if login.isEmpty {
            return .loginIsEmpty
        }
        
        if password.isEmpty {
            return .passwordIsEmpty
        }
        
        if login.count > maxUsernameLength {
            return .toLongUsername
        }
        
        if password.count < minimumPasswordLength {
            return .toShortPassword
        }
        
        if password != users[login] {
            return .wrongPassword
        }
        return nil
    }
    
    func register(login: Login, password: Password) -> Result<Login, RegisterError> {
        if let error = validate(login: login, password: password) {
            if error == .userExist {
           
            } else {
                
            }
            
            return .failure(error)
        }
        users[login] = password
        return .success(login)
    }
    
    private func validate(login: Login, password: Password) -> RegisterError? {
        if let _ = users[login] {
            return .userExist
        }
        
        if String(repeating: " ", count: login.count) == login {
            return .whitespaces
        }
        
        if login.count > maxUsernameLength {
            return .toLongUsername
        }
        
        if password.count < minimumPasswordLength {
            return .toShortPassword
        }
        return nil
    }
}
