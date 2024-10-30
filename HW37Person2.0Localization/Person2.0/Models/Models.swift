//
//  Models.swift
//  HW37Person2.0Localization
//
//  Created by Вячеслав Башур on 21/10/2024.
//

import Foundation
import UIKit

class Models {
    
    enum Hobbie {
        struct Request {
            let changedHobbies: [String]
        }
        
        struct Response: Codable {
            var hobbies: [String]
        }
        
        struct ViewModel {
            let hobbies: String
        }
    }
    
    enum Person {
        struct Request {
            let changedPerson: Person.Response
        }
        
        struct Response: Codable {
            let name: String
            let surename: String
            let age: String
            let birthday: Date
            let male: String
        }
        
        struct ViewModel {
            let name: String
            let surename: String
            let age: String
            let birthday: String
            let male: String
        }
    }
}
