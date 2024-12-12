//
//  Models.swift
//  HW43-HW47SwiftUI
//
//  Created by Вячеслав Башур on 12/12/2024.
//

import Foundation

struct Element: Codable, Identifiable {
    var id = UUID().uuidString
    let name: String
    let count: Int
}
