//
//  Models.swift
//  HW40Firebase
//
//  Created by Вячеслав Башур on 03/12/2024.
//

import Foundation

struct UserData: Identifiable {
    var id: String = UUID().uuidString
    let email: String
    let password: String
    var name: String? = nil
}

struct User: Identifiable {
    var id: String = UUID().uuidString
    var name: String? = nil
}
