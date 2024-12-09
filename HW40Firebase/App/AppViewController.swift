//
//  AppViewController.swift
//  HW40Firebase
//
//  Created by Вячеслав Башур on 04/12/2024.
//

import UIKit

class AppViewController: UIViewController {
    
    var user: User?
    
    let service = AuthService()
    
    let cellId = "cell"
    
    var list: [Element] = [] {
        willSet{
            tableView.reloadData()
        }
    }
    
    lazy var fullNamelabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var exitAction: UIAction = .init(handler: { [weak self] _ in
        guard let self else { return }
        self.service.signOut()
        dismiss(animated: true)
    })
    
    lazy var exitButton = {
        let button = UIButton(type: .system, primaryAction: exitAction)
        button.setTitle("выйти", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var tableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.dataSource = self
        table.delegate = self
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray4
        view.addSubview(fullNamelabel)
        view.addSubview(tableView)
        view.addSubview(exitButton)
        NSLayoutConstraint.activate([
            fullNamelabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            fullNamelabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            fullNamelabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            fullNamelabel.bottomAnchor.constraint(equalTo: tableView.topAnchor),
            
            tableView.topAnchor.constraint(equalTo: fullNamelabel.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: exitButton.topAnchor),
            
            exitButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            exitButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        if user != nil {
            guard let name = user?.name, let surename = user?.surename else { return }
            fullNamelabel.text = "Пользователь: \(name) \(surename))"
        }
    }

}

extension AppViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        guard let cell else { return UITableViewCell()}
        var config = cell.defaultContentConfiguration()
        let element = list[indexPath.row]
        config.text = element.name
        config.secondaryText = element.price
        cell.contentConfiguration = config
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = CreateElementViewController()
        let element = list[indexPath.row]
        vc.element = element
        present(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        return .init(actions: [.init(style: .destructive, title: "del", handler: { _,_,_  in
            print(1)
        })])
    }
}
