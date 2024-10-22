//
//  PersonPresenter.swift
//  HW37Person2.0Localization
//
//  Created by Вячеслав Башур on 19/10/2024.
//

import Foundation

protocol PersonPresentatitionLogic: AnyObject {
    func presenterPerson(_ response: Models.Person.Response)
}

class PersonPresenter: PersonPresentatitionLogic {
    weak var controller: PersonDisplayLogic?
    
    func presenterPerson(_ response: Models.Person.Response) {
        
        
        let viewModel: Models.Person.ViewModel = .init(name: response.name, surename: response.surename, age: response.age, birthday: response.birthday, male: response.male)
        
        controller?.displayPerson(viewModel)
    }
    
}
