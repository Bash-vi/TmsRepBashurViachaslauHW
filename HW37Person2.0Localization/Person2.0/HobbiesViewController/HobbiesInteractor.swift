//
//  HobbiesInteractor.swift
//  HW37Person2.0Localization
//
//  Created by Вячеслав Башур on 02/11/2024.
//

import Foundation

protocol HobbiesBissnesLogic: AnyObject {
    func currentHobbies() -> [String]
    func loadHobbies()
    func addHobbie(hobbie: String)
    func deleteHobbie(hobbie :String)
}

class HobbiesInteractor: HobbiesBissnesLogic {
    func currentHobbies() -> [String] {
        let hobbies = storage.currentHobbies().hobbies
        return hobbies
    }
    
    
    var presenter: HobbiesPresentationLogic?
    
    let storage: StorageHobbie = Storage()
    
    func loadHobbies() {
        presenter?.presenterHobbies(storage.currentHobbies())
    }
    
    func addHobbie(hobbie: String) {
        storage.add(hobbie: hobbie)
    }
    
    func deleteHobbie(hobbie :String) {
        storage.delete(hobbie: hobbie)
    }
}
