//
//  serviceUserDefault.swift
//  HW12delegatsAndCollback
//
//  Created by Вячеслав Башур on 12/09/2024.
//

import Foundation

let defaults = UserDefaults.standard

class serviceUserDefault {
    static let sharid = serviceUserDefault()
    
    func showUserDefaults(key: String) -> String {
       let value = defaults.string(forKey: key) ?? "Введите"
        return value
    }
    
    func addUserDefaults(key: String, value: Any) {
        defaults.set(value, forKey: key)
    }
    
    func showHobbie() -> String {
        let hobbies = defaults.stringArray(forKey: KeysDefaults.hobbie) ?? []
        return hobbies.joined(separator: " ,")
    }
    
    func returnHobbie() -> [String] {
        let hobbies = defaults.stringArray(forKey: KeysDefaults.hobbie) ?? []
        return hobbies
    }
}
