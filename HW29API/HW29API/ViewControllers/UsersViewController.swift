//
//  UsersViewController.swift
//  HW29API
//
//  Created by Вячеслав Башур on 18/09/2024.
//

import UIKit

class UsersViewController: UIViewController {
    
    lazy var tableView = {
        let table = UITableView(frame: view.frame, style: .plain)
        table.dataSource = self
        table.backgroundColor = .darkGray
        table.register(UserCell.self, forCellReuseIdentifier: UserCell.reuseId)
        return table
    }()
    
    var users: [User] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    func presentPosts(users: [User]) {
        self.users = users
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        loadUsers()
    }
    
    func loadUsers() {
        let netWork = NetWork()
        netWork.loadUsers(complition: { [weak self] users in
            DispatchQueue.main.async {
                self?.presentPosts(users: users)
            }
        })
    }
    
}

extension UsersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UserCell.reuseId, for: indexPath)
        return cell
    }
    
    
}
