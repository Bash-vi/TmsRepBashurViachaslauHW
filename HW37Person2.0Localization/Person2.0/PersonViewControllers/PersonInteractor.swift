//
//  PersonInteractor.swift
//  HW37Person2.0Localization
//
//  Created by Вячеслав Башур on 19/10/2024.
//

import Foundation

protocol HobbiesBissnesLogic: AnyObject {
    
}

protocol EditPersonBissnesLogic: AnyObject {
    func savePerson(_ request: Models.Person.Request)
    func loadPerson()
}

protocol PersonBissnesLogic: AnyObject {
    func loadPerson()
    func loadHobbies()
}

class PersonInteractor: PersonBissnesLogic, EditPersonBissnesLogic {
  
    var presenter: PersonPresentatitionLogic?
    let storage: StoragePerson = Storage()
    
    func loadPerson() {
        presenter?.presenterPerson(storage.currentPerson())
    }
    
    func loadHobbies() {
        
    }
    
    func savePerson(_ request: Models.Person.Request) {
        let changedPerson: Models.Person.Response = .init(
            name: request.changedPerson.name,
            surename: request.changedPerson.surename,
            age: request.changedPerson.age,
            birthday: request.changedPerson.birthday,
            male: request.changedPerson.male
        )
        storage.save(person: changedPerson)
    }
}
    

