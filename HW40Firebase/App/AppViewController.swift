//
//  AppViewController.swift
//  HW40Firebase
//
//  Created by Вячеслав Башур on 04/12/2024.
//

import UIKit

protocol AppViewControllerDelegate {
    func updateData()
}

class AppViewController: UIViewController {
    
    var user: User?
    
    let service = AuthService()
    
    var elementService = ElementService()
    
    let cellId = "cell"
    
    @MainActor
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
    
    lazy var addButton = {
        let button = UIButton(type: .system, primaryAction: .init(handler: { [weak self] _ in
            let vc = CreateElementViewController()
            let service = ElementService()
            vc.service = service
            self?.present(vc, animated: true)
        }))
        button.setTitle("добавить элемент", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    func loadUserData() {
        Task {
            let currentUser = await service.getUserData()
            let elements = await elementService.readElements()
            Task { @MainActor in
                self.user = currentUser
                self.list = elements
                if user != nil {
                    guard let name = user?.name, let surename = user?.surename else { return }
                    fullNamelabel.text = "Пользователь: \(name) \(surename)"
                }
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.loadUserData()
    }
    
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
        loadUserData()
        view.backgroundColor = .systemGray4
        view.addSubview(fullNamelabel)
        view.addSubview(tableView)
        view.addSubview(exitButton)
        view.addSubview(addButton)
        NSLayoutConstraint.activate([
            fullNamelabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            fullNamelabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            fullNamelabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            
            addButton.topAnchor.constraint(equalTo: fullNamelabel.bottomAnchor),
            addButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            addButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            
            tableView.topAnchor.constraint(equalTo: addButton.bottomAnchor,constant: 10),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: exitButton.topAnchor),
            
            exitButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            exitButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
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
        return .init(actions: [.init(style: .destructive, title: "удалить", handler: { [weak self] _,_,_  in
            let elementId = self?.list[indexPath.row].id
            guard let elementId else { return }
            Task {
                await self?.elementService.delete(elementId: elementId)
                Task {@MainActor in tableView.reloadData()}
            }
        })])
    }
}

extension AppViewController: AppViewControllerDelegate {
    func updateData() {
        tableView.reloadData()
    }
}
