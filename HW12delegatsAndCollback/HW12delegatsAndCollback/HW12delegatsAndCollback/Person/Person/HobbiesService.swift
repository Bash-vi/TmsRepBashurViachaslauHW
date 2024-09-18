//
//  PersonService.swift
//  HW12delegatsAndCollback
//
//  Created by Вячеслав Башур on 11/09/2024.
//

import Foundation

class HobbiesService {
    static let sharid = HobbiesService()
    
    var hobbies: [String] = []
    
    func addHobbie(hobbie: String) {
        hobbies.append(hobbie)
    }
}
