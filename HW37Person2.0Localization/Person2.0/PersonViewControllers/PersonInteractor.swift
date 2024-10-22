//
//  PersonInteractor.swift
//  HW37Person2.0Localization
//
//  Created by Вячеслав Башур on 19/10/2024.
//

import Foundation

protocol PersonBissnesLogic: AnyObject {
    func buttonActions(_ request: Models.Person.Request)
    func currentPerson()
    
}

class PersonInteractor: PersonBissnesLogic {
  
    var presenter: PersonPresentatitionLogic?
    let storage = Storage()
    
    func currentPerson() {
//        presenter?.presenterPerson(storage.person)
    }
    
    func buttonActions(_ request: Models.Person.Request) {
        switch request.buttonActions {
        case .editInfo:
            print(1)
        case .presentHobbies:
            presenter?.presenterPerson(storage.person)
        }
    }
    
}
