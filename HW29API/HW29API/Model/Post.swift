//
//  Post.swift
//  HW29API
//
//  Created by Вячеслав Башур on 18/09/2024.
//

import Foundation

// MARK: - post
struct Post: Codable {
    let userID, id: Int
    let title, body: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}
