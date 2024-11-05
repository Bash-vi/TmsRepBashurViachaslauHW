//
//  HobbiesPresenter.swift
//  HW37Person2.0Localization
//
//  Created by Вячеслав Башур on 02/11/2024.
//

import Foundation

protocol HobbiesPresentationLogic: AnyObject {
    func presenterHobbies(_ hobbies: Models.Hobbie.Response)
}

class HobbiesPresenter: HobbiesPresentationLogic {
    
    weak var controller: HobbiesDisplayLogic?
    
    func presenterHobbies(_ hobbies: Models.Hobbie.Response) {
        controller?.displayHobbies(hobbies)
    }
}
