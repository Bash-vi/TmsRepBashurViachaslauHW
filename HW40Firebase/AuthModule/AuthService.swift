//
//  AuthService.swift
//  HW40Firebase
//
//  Created by Вячеслав Башур on 03/12/2024.
//

import Foundation
import Firebase
import FirebaseAuth

protocol AuthProtocol {
    
}

enum AuthError: Error {
    case wrongLoginOrPassword
    
    var errorMessege: String {
        return switch self {
        case .wrongLoginOrPassword: "неправильный"
        }
    }
}

actor AuthService: AuthProtocol {
    func createUser(email: String, password: String) async -> Result<User, AuthError> {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
//            try await result.user.sendEmailVerification()
            signOut()
            return .success(.init(id: result.user.uid))
        } catch {
            print(AuthError.wrongLoginOrPassword.errorMessege)
            return .failure(.wrongLoginOrPassword)
        }
    }
    
    func sighIn(email: String, password: String) async -> Result<Bool, AuthError> {
        do {
            _ = try await Auth.auth().signIn(withEmail: email, password: password)
            return .success(true)
        } catch {
            return .failure(.wrongLoginOrPassword)
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print(error)
        }
    }
    
    func isLogin() -> Bool {
        if let _ = Auth.auth().currentUser {
            return true
        } else {
            return false
        }
    }
}
