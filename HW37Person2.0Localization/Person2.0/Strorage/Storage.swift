//
//  Storage.swift
//  HW37Person2.0Localization
//
//  Created by Вячеслав Башур on 19/10/2024.
//

import Foundation

protocol StorageHobbie: AnyObject {
    func currentHobbies() -> Models.Hobbie.Response
    func add(hobbie: String)
    func delete(hobbie: String)
}

protocol StoragePerson: AnyObject {
    func currentPerson() -> Models.Person.Response
    func save(person: Models.Person.Response)
    func remove()
}

class Storage: StoragePerson, StorageHobbie {
    
    let defaults = UserDefaults.standard
    let keyPerson = "person"
    let keyHobbies = "hobbies"
    
    let defaultPerson = Models.Person.Response(
        name: "Ваше Имя",
        surename: "Ваша Фамилия",
        age: "Ваш Возраст",
        birthday: .now,
        male: "Ваш пол"
    )
    
    let defaultHobbies = Models.Hobbie.Response(hobbies: ["Ваши увлечения"])
    
    func currentPerson() -> Models.Person.Response {
        guard let data = defaults.data(forKey: keyPerson) else { return defaultPerson }
        let decoder = JSONDecoder()
        guard let person = try? decoder.decode(Models.Person.Response.self, from: data) else { return defaultPerson }
        return person
    }
    
    func save(person: Models.Person.Response) {
        let encoder = JSONEncoder()
        let data = try? encoder.encode(person)
        defaults.set(data, forKey: keyPerson)
    }
    
    func remove() {
        defaults.removeObject(forKey: keyPerson)
    }
    
    func currentHobbies() -> Models.Hobbie.Response {
        guard let data = defaults.data(forKey: keyHobbies) else { return defaultHobbies }
        let decoder = JSONDecoder()
        guard let hobbies = try? decoder.decode(Models.Hobbie.Response.self, from: data) else { return defaultHobbies }
        return hobbies
    }
    
    private func save(hobbies: Models.Hobbie.Response) {
        let encoder = JSONEncoder()
        let data = try? encoder.encode(hobbies)
        defaults.set(data, forKey: keyHobbies)
    }
    
    func add(hobbie: String) {
        var currentHobbies = currentHobbies()
        currentHobbies.hobbies.append(hobbie)
        save(hobbies: currentHobbies)
    }
    
    func delete(hobbie: String) {
        var currentHobbies = currentHobbies()
        currentHobbies.hobbies.removeAll {
            $0 == hobbie
        }
        save(hobbies: currentHobbies)
    }
}
