//
//  PersonPresenter.swift
//  HW37Person2.0Localization
//
//  Created by Вячеслав Башур on 19/10/2024.
//

import Foundation

protocol PersonPresentatitionLogic: AnyObject {
    func presenterPerson(_ response: Models.Person.Response)
    func presenterHobbies(_ response: Models.Hobbie.Response)
}

class PersonPresenter: PersonPresentatitionLogic {
   
    weak var controller: PersonDisplayLogic?
    
    let dateFormater = DateFormatter()
    
    func presenterPerson(_ response: Models.Person.Response) {
        dateFormater.dateStyle = .short
        let viewModel: Models.Person.ViewModel = .init(
            name: response.name,
            surename: response.surename,
            age: String(response.age),
            birthday: dateFormater.string(from: response.birthday),
            male: response.male
        )
        controller?.displayPerson(viewModel)
    }
    
    func presenterHobbies(_ response: Models.Hobbie.Response) {
        let hobbies = response.hobbies.joined(separator: ",")
        let viewModel = Models.Hobbie.ViewModel.init(hobbies: hobbies)
        controller?.displayHobbies(viewModel)
    }
}
