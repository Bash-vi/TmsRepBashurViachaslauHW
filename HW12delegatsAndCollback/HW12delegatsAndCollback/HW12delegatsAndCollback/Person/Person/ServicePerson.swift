//
//  StoragePerson.swift
//  HW12delegatsAndCollback
//
//  Created by Вячеслав Башур on 11/09/2024.
//

import Foundation

class ServicePerson {
   
    let defaults = UserDefaults.standard
    
    static let shared = ServicePerson()
    
    var person: Person {
        Person(
            name: defaults.string(forKey: KeysDefaults.name) ?? "Введите",
            surename: defaults.string(forKey: KeysDefaults.surename) ?? "Введите",
            age: defaults.string(forKey: KeysDefaults.age) ?? "Введите",
            birthday: defaults.string(forKey: KeysDefaults.birthday) ?? "Введите",
            male: defaults.string(forKey: KeysDefaults.male) ?? "Введите",
            hobbies: defaults.stringArray(forKey: KeysDefaults.hobbie) ?? []
        )
    }
    
    func saveData(key: String, value: Any) {
        defaults.set(value, forKey: key)
    }
    
    func showHobbie() -> String {
        return person.hobbies.joined(separator: " ,")
    }
    
    func removeHobbie(hobbie: String) {
        let hobbies = person.hobbies.filter {
            $0 == hobbie
        }
        saveData(key: KeysDefaults.hobbie, value: hobbies)
    }
}

