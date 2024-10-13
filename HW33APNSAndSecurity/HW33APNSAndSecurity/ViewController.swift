//
//  ViewController.swift
//  HW33APNSAndSecurity
//
//  Created by Вячеслав Башур on 13/10/2024.
//

import UIKit

class ViewController: UIViewController {
    
    let service = BirthdayService()

    var birthdays: [Birthday] { service.currentBirthdays }

    let cellId = "birthdayCell"

    lazy var titleLabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.textAlignment = .center
        label.text = "Имена"
        return label
    }()

    lazy var addButton = {
        let button = UIButton(
            type: .system,
            primaryAction: UIAction(handler: { [weak self] _ in self?.add()})
        )
        button.setImage(.add, for: .normal)
        return button
    }()

    lazy var pageTitle = {
        let stack = UIStackView(arrangedSubviews: [
            titleLabel,
            addButton
        ])
        stack.distribution = .fillProportionally
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    lazy var tableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.delegate = self
        table.dataSource = self
        table.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(pageTitle)
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            pageTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            pageTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constant.indent),
            pageTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constant.indent),

            tableView.topAnchor.constraint(equalTo: pageTitle.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constant.indent),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constant.indent),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func mediumPresentViewController(_ vc: UIViewController) {
        vc.modalPresentationStyle = .pageSheet
        vc.sheetPresentationController?.detents = [.medium()]
        self.present(vc, animated: true)
    }
    
    func add() {
        let vc = CreateBirthdayViewController(saveBirthday: { [weak self] name, date in
            self?.service.create(name: name, date: date)
            self?.tableView.reloadData()
        })
        mediumPresentViewController(vc)
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        birthdays.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId) else { return UITableViewCell() }
        cell.textLabel?.text = birthdays[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = BirthdayViewController(birthday: birthdays[indexPath.row])
        mediumPresentViewController(vc)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        return .init(actions: [.init(
            style: .destructive,
            title: "Удалить",
            handler: { [weak self] _,_,_ in
                guard let self else { return }
                self.service.delete(birthday: birthdays[indexPath.row])
                tableView.reloadData()
            }
        )])
    }
}

