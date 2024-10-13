//
//  AchievementsVC.swift
//  HW30SaveData
//
//  Created by Вячеслав Башур on 29/09/2024.
//

import UIKit

class AchievementsVC: UIViewController {
    
    private let service = StorageService(storage: Storage())
    
    lazy var table = UITableView()
    
    let cellId = "achievements"
    
    var achievements: [String] { service.currentAchievements() }
    
    private lazy var removeButton = AppButton(actionButton: { self.actionRevomeButton() }, style: .remove)
    
    private lazy var titleLabel = AppLabel(style: .pageTitle)
    
    private lazy var stack = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.spacing = Constant.spacing
        return stack
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        table.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setTitle()
        setTable()
    }
    
    private func setTitle() {
        titleLabel.text = "Доска достижений"
        view.addSubview(stack)
        stack.addArrangedSubview(titleLabel)
        stack.addArrangedSubview(removeButton)
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constant.indent),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constant.indent),
        ])
    }
    
    private func setTable() {
        table.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.dataSource = self
        view.addSubview(table)
        NSLayoutConstraint.activate([
            table.topAnchor.constraint(
                equalTo: stack.bottomAnchor
            ),
            table.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Constant.indent
            ),
            table.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -Constant.indent
            ),
            table.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                constant: -Constant.botTableIndent
            )
        ])
    }
    
    private func actionRevomeButton() {
        let removeAchievementsAlert = UIAlertController(
            title: "Внимание",
            message: "Вы уверены, что ходите очистить доску достижений?",
            preferredStyle: .alert
        )
        removeAchievementsAlert.addAction(UIAlertAction(
            title: "Да",
            style: .destructive,
            handler: { _ in
                self.service.deleteAchievements()
                self.table.reloadData()
            })
        )
        removeAchievementsAlert.addAction(UIAlertAction(title: "Нет", style: .default))
        self.present(removeAchievementsAlert, animated: true)
    }
}

extension AchievementsVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        achievements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId) else { return UITableViewCell() }
        let achievements = achievements[indexPath.row]
        var config = cell.defaultContentConfiguration()
        config.text = achievements
        config.image = UIImage(systemName: "star.circle")
        cell.contentConfiguration = config
        return cell
    }
}
