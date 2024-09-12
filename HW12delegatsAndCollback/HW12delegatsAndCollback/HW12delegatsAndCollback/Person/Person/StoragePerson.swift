//
//  StoragePerson.swift
//  HW12delegatsAndCollback
//
//  Created by Вячеслав Башур on 11/09/2024.
//

import Foundation

class StoragePerson {
    static let sharid = StoragePerson()
    
    let person = Person(
        name: defaults.string(forKey: KeysDefaults.name) ?? "Введите",
        surename: defaults.string(forKey: KeysDefaults.surename) ?? "Введите",
        age: defaults.string(forKey: KeysDefaults.age) ?? "Введите",
        birthday: defaults.string(forKey: KeysDefaults.birthday) ?? "Введите",
        male: defaults.string(forKey: KeysDefaults.male) ?? "Введите",
        hobbie: defaults.stringArray(forKey: KeysDefaults.hobbie) ?? []
    )
}
// хотел так попробовать, но отображает данные после перезапуска только
// что-то вроде Label.text = sharid.person.name
