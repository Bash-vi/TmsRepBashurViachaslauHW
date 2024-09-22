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
        let cell = tableView.dequeueReusableCell(withIdentifier: UserCell.reuseId, for: indexPath) as? UserCell
        guard let cell else { return UITableViewCell() }
        cell.backgroundColor = .darkGray
        let users = users[indexPath.row]
        cell.setupUserStack(
            nameValue: users.name,
            usernameValue: users.username,
            emailValue: users.email,
            phoneValue: users.phone,
            websiteValue: users.website
        )
        cell.setupAdressStack(
            streetValue: users.address.street,
            suiteValue: users.address.suite,
            cityValue: users.address.city,
            zipcodeValue: users.address.zipcode,
            latValue: users.address.geo.lat,
            lngValue: users.address.geo.lng
        )
        cell.setupCompanyStack(
            companyNameValue: users.company.name,
            catchPhraseValue: users.company.catchPhrase,
            bsValue: users.company.bs
        )
        return cell
    }
    
    
}
