//
//  NetWork.swift
//  HW29API
//
//  Created by Вячеслав Башур on 18/09/2024.
//

import Foundation

class NetWork {
    enum APIHandlers {
        static let posts = "https://jsonplaceholder.typicode.com/posts"
        static let users = "https://jsonplaceholder.typicode.com/users"
    }
    
    func loadUsers(complition: @escaping ([User]) -> Void) {
        guard let url = URL(string: APIHandlers.users) else { return }
        let request = URLRequest(url: url)
        let dataTask = URLSession.shared.dataTask(with: request) { data, _, _ in
            guard let data else { return }
            let decoder = JSONDecoder()
            let users: [User]? = try? decoder.decode([User].self, from: data)
            guard let users else { return }
            complition(users)
        }
        dataTask.resume()
    }
    
    func loadPosts(complition: @escaping ([Post]) -> Void) {
        guard let url = URL(string: APIHandlers.posts) else { return }
        let request = URLRequest(url: url)
        let dataTask = URLSession.shared.dataTask(with: request) { data, _, _ in
            guard let data else { return }
            let decoder = JSONDecoder()
            let posts: [Post]? = try? decoder.decode([Post].self, from: data)
            guard let posts else { return }
            complition(posts)
        }
        dataTask.resume()
    }
}
