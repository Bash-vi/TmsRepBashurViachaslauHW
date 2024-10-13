//
//  Storage.swift
//  HW33APNSAndSecurity
//
//  Created by Вячеслав Башур on 13/10/2024.
//

import Foundation

class Storage {
    private let defaults = UserDefaults.standard
    private let key: String = "birthday"
    
    func savedBirthdays() -> [Birthday] {
        guard let data = defaults.data(forKey: key) else { return [] }
        let decoder = JSONDecoder()
        guard let birthdays = try? decoder.decode([Birthday].self, from: data) else { return [] }
        return birthdays
    }
    
    private func save(birthdays: [Birthday]) {
        let encoder = JSONEncoder()
        let data = try? encoder.encode(birthdays)
        defaults.set(data, forKey: key)
    }
    
    func add(birthday: Birthday) {
        var currentBirthdays = savedBirthdays()
        currentBirthdays.append(birthday)
        save(birthdays: currentBirthdays)
    }
    
    func delete(birthday: Birthday) {
        var currentBirthdays = savedBirthdays()
        currentBirthdays.removeAll { $0 == birthday }
        save(birthdays: currentBirthdays)
    }
}
