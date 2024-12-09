//
//  Models.swift
//  HW40Firebase
//
//  Created by Вячеслав Башур on 03/12/2024.
//

import Foundation

struct Element: Identifiable {
    var id: String = UUID().uuidString
    let price: String
    var name: String
}

struct User: Identifiable, Codable {
    var id: String = UUID().uuidString
    var name: String? = nil
    var surename: String? = nil
}
