//
//  Models.swift
//  HW37Person2.0Localization
//
//  Created by Вячеслав Башур on 21/10/2024.
//

import Foundation
import UIKit

class Models {
    
    enum Person {
        
        struct Request {
            let buttonActions: buttonActions
        }
        
        struct Response {
            let name: String
            let surename: String
            let age: String
            let birthday: String
            let male: String
        }
        
        struct ViewModel {
            let name: String
            let surename: String
            let age: String
            let birthday: String
            let male: String
        }
        
        enum buttonActions {
            case editInfo
            case presentHobbies
        }
    }
}
